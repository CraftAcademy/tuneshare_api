class PostIndexSerializer < ActiveModel::Serializer
  attributes :id, :track, :artists, :image, :preview, :description, :likes
  has_many :comments, serializer: CommentsIndexSerializer

  def likes
    object.likes.count
  end
end
