class PostIndexSerializer < ActiveModel::Serializer
  attributes :id, :track, :artists, :image, :preview, :description, :comments

  def comments
    object.comments
  end
end
