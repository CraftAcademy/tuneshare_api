class Post < ApplicationRecord
  validates_presence_of :track, :artists, :image, :preview, :description
end
