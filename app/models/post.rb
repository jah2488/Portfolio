class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,    type: String
  field :body,     type: String
  field :category, type: String
  field :pubdate,  type: Date
  field :type,     type: String
  field :notes,    type: String
  
  before_save :set_date


  private

  def set_date
  	self.pubdate = self.created_at
  end
end
