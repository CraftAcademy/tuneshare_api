class PostIndexSerializer < ActiveModel::Serializer
  attributes :id, :track, :artists, :image, :preview, :description, :comments
  has_many :comments

  def comments
    object.comments
  end
end
