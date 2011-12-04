class Project
  include Mongoid::Document
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
end
