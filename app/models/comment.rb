class Comment < ActiveRecord::Base
  belongs_to :highlight
  attr_accessible :body, :commenter
end
