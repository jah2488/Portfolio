class Post
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Mongoid::Timestamps
  field :title,    type: String
  field :body,     type: String
  field :category, type: String
  field :pubdate,  type: Date
  field :type,     type: String
  field :notes,    type: String
  
  before_save :set_date
  has_mongoid_attached_file :picture, :styles => { :small => ['150x150#', :png], :large => ['500x500>', :png]}
  slug :title
  slug :title

  private

  def set_date
  	self.pubdate = self.created_at
  end

end
