class Post < ApplicationRecord
  validates_presence_of :track_name, :artists, :image, :preview_url, :description
end
