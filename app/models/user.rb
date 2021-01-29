# frozen_string_literal: true
class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:spotify]
  include DeviseTokenAuth::Concerns::User

  has_many :posts
end

