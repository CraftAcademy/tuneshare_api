# frozen_string_literal: true
module Api
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    include Devise::Controllers::Rememberable

    def omniauth_success
      get_resource_from_auth_hash
      set_token_on_resource
      create_auth_params
      sign_in(:user, @resource, store: false, bypass: false)

      @resource.save!

      response.set_header('access-token', auth_params[:auth_token])
      response.set_header('token-type', 'Bearer')
      response.set_header('client', auth_params[:client_id])
      response.set_header('expiry', auth_params[:expiry])
      response.set_header('uid', auth_params[:uid])
      response.set_header('spotify_credentials', auth_hash.credentials) 

      render json: { user: @resource, spotify_info: auth_hash.info }
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

    def default_devise_mapping
      'User'.constantize
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
end
