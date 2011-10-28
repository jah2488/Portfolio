class Post
  include Mongoid::Document
  field :title,    type: String
  field :body,     type: String
  field :category, type: String
  field :pubdate,  type: Date
  field :type,     type: String
  field :notes,    type: String
end
