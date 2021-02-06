class Api::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  # before_action :foo
  # def foo
  #   binding.pry

  #   # https://medium.com/@grigorylapshin/oauth-in-react-native-with-expo-c383ee371f4a
  # end

  def redirect_callbacks
    # derive target redirect route from 'resource_class' param, which was set
    # before authentication.
    devise_mapping = get_devise_mapping
    redirect_route = get_redirect_route(devise_mapping)

    # preserve omniauth info for success route. ignore 'extra' in twitter
    # auth response to avoid CookieOverflow.
    session['dta.omniauth.auth'] = request.env['omniauth.auth'].except('extra')
    session['dta.omniauth.params'] = request.env['omniauth.params']
    redirect_url = request.env['omniauth.params']['redirect_url']
    redirect_to (redirect_route + "?redirect_url=#{redirect_url}")
  end

  def validate_auth_origin_url_param
    return render_error_not_allowed_auth_origin_url if auth_origin_url && blacklisted_redirect_url?(auth_origin_url)
  end

  def get_redirect_route(devise_mapping)
    path = "#{Devise.mappings[devise_mapping.to_s.downcase.to_sym].fullpath}/#{params[:provider]}/callback"
    klass = request.scheme == 'https' ? URI::HTTPS : URI::HTTP
    redirect_route = klass.build(host: request.host, port: request.port, path: path).to_s
  end

  def omniauth_success
    get_resource_from_auth_hash
    set_token_on_resource
    create_auth_params
    sign_in(:user, @resource, store: false, bypass: false)
    # This is a hack to allow multiple OAuth sources
    # we could also respond with a message that the user already exists and should choose to login using
    # the origina OAuth provider.
    begin
      @resource.save!
    rescue ActiveRecord::RecordNotUnique => e
      @resource = resource_class.where(
        email: auth_hash['info']['email']
      ).first
    end
    data = { message: 'success', data: @resource, oauth_info: auth_hash['info'] }

    if params['redirect_url']
      credentials = {
        oauth_credentials: auth_hash[:credentials],
        dta_credentials: {
          'access-token': auth_params[:auth_token],
          'token-type': 'Bearer',
          'client': auth_params[:client_id],
          'expiry': auth_params[:expiry],
          'uid': auth_params[:uid]
        }
      }
      redirect_to((params['redirect_url'] + "?data=#{data.merge!(credentials).to_json}")) && return
    else
      response.set_header('oauth_credentials', auth_hash[:credentials]) # not sure about this at all
      # DTA should do this for us?
      response.set_header('access-token', auth_params[:auth_token])
      response.set_header('token-type', 'Bearer')
      response.set_header('client', auth_params[:client_id])
      response.set_header('expiry', auth_params[:expiry])
      response.set_header('uid', auth_params[:uid])
      render json: { message: 'success', data: @resource, oauth_info: auth_hash['info'] }
    end
  end

  def validate_auth_origin_url_param
    return render_error_not_allowed_auth_origin_url if auth_origin_url && blacklisted_redirect_url?(auth_origin_url)
  end

  protected

  def get_resource_from_auth_hash
    # here we would have to make sure that we have a connection to the Authorization model if
    # we decide to use multiple authorizations
    @resource = resource_class.where(
      uid: auth_hash['uid'],
      provider: auth_hash['provider']
    ).first_or_initialize

    handle_new_resource if @resource.new_record?

    # sync user info with provider, update/generate auth token
    assign_provider_attrs(@resource, auth_hash)

    # assign any additional (whitelisted) attributes
    if assign_whitelisted_params?
      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params
    end

    @resource
  end

  def auth_hash
    @_auth_hash ||= session.to_h.with_indifferent_access['dta.omniauth.auth']
    session.delete('dta.omniauth.auth')
    @_auth_hash
  end

  def default_devise_mapping
    request.env['devise.mapping'].class_name.constantize
  end

  def resource_class
    if omniauth_params[:resource_class]
      omniauth_params[:resource_class].constantize
    elsif params[:resource_class]
      params[:resource_class].constantize
    else
      default_devise_mapping
    end
  end

  def assign_provider_attrs(user, auth_hash)
    attrs = auth_hash['info'].to_hash
    attrs = attrs.slice(*user.attribute_names)
    user.assign_attributes(attrs)
  end

  def whitelisted_params
    whitelist = params_for_resource(:sign_up)
    whitelist.each_with_object({}) do |key, coll|
      param = omniauth_params[key.to_s]
      coll[key] = param if param
    end
  end
end