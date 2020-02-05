class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :updated_at, :status
  belongs_to :user
  # user model の一部の属性のみ返したいため
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
