# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:spotify]
  include DeviseTokenAuth::Concerns::User

  # def self.from_omniauth(auth)
  #   binding.pry
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     #      user.name = auth.info.name   # assuming the user model has a name
  #     #      user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end
end

# @resource = resource_class.where(
#   uid: auth_hash['uid'],
#   provider: auth_hash['provider']
# ).first_or_initialize
