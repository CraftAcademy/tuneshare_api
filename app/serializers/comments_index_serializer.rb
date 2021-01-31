class CommentsIndexSerializer < ActiveModel::Serializer
  attributes :id, :content, :user

  def user
    object.user.uid
  end
end
