class Project
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Mongoid::Timestamps
  field :title,       type: String
  field :description, type: String
  field :language,    type: String
  field :deployed,    type: Boolean
  field :start_date,  type: Date
  field :end_date,    type: Date
  field :platform,    type: String
  field :database,    type: String
  field :notes,       type: String

  has_mongoid_attached_file :screenshot, 
  :path   => 'assets/:attachment/:style.:extension',
  :styles => { :small => ['150x150#', :png], :large => ['500x500>', :png]}
  slug :title
  
  def search(query)
    find(query)
  end
end
