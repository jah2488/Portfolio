class Project
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Slug
  include Mongoid::Timestamps
  field :title,       type: String
  field :url,         type: String
  field :description, type: String
  field :language,    type: String
  field :deployed,    type: Boolean
  field :start_date,  type: Date
  field :end_date,    type: Date
  field :platform,    type: String
  field :notes,       type: String

  validates_presence_of :language, :title, :platform, :start_date

  has_mongoid_attached_file :screenshot, 
  :styles => { :thumb => ['100x100#', :png], :small => ['225x250#', :png], :large => ['500x500^', :png]}
  slug :title


  def search(query)
    find(query)
  end

end
