class Post < ApplicationRecord
  validates_presence_of :track, :artists, :description

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
