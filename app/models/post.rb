# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text
#  picture     :string(255)
#  string      :string(255)
#  journal_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :journal_id, :picture
  
  belongs_to :post
  
  validates :description, :length => { :maximum => 140 }
  validates :journal_id, :presence => true
  
  # Do not include root in json for each individual post
  # We will wrap all posts in a post array in the controller
  self.include_root_in_json = false
end
