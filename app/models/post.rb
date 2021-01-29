class Post < ApplicationRecord
  validates_presence_of :track, :artists, :image, :preview, :description

  belongs_to :user
end
