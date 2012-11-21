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
  
  self.include_root_in_json = true
end
