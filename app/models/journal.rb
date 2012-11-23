# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  gender     :string(255)
#  birthdate  :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Journal < ActiveRecord::Base
  attr_accessible :birthdate, :gender, :name, :user_id
  
  belongs_to :user
  has_many :posts
  
  validates :gender, :length => { :maximum => 10 }
  validates :user_id, :presence => true
  
  # Do not include root in json for each individual journal
  # We will wrap all journals in a journal array in the controller
  self.include_root_in_json = false
end
