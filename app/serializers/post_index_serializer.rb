class PostIndexSerializer < ActiveModel::Serializer
  attributes :id, :track, :artists, :image, :preview, :description
  has_many :comments, serializer: CommentsIndexSerializer
end
