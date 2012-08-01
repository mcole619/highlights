class Highlight < ActiveRecord::Base
  attr_accessible  :title, :description, :user_id
  belongs_to :user
  validates_presence_of :title, :description
end
