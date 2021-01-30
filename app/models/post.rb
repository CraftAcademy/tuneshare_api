class Post < ApplicationRecord
  validates_presence_of :track, :artists, :description

  belongs_to :user
  has_many :comments
end
