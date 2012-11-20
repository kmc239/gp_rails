class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :journal_id, :picture
  
  belongs_to :post
  
  validates :description, :length => { :maximum => 140 }
  validates :journal_id, :presence => true
  
  self.include_root_in_json = true
end
