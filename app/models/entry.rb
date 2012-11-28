# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  description :text
#  picture     :string(255)
#  string      :string(255)
#  journal_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Entry < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :journal_id, :picture
  
  belongs_to :journal
  
  # Server-side validation. Validation also occurs client-side.
  validates_presence_of :journal
  
  validates :description, :length => { :maximum => 140 }
  validates :journal_id, :presence => true
  
  # Do not include root in json for each individual entry
  # We will wrap all entries in a entry array in the controller
  self.include_root_in_json = false
end
