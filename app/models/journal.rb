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
  has_many :entries
  
  # Server-side validation. Validation also occurs client-side.
  validates_presence_of :user
  
  validates :birthdate, :presence => true
  validates :gender, :presence => true, :length => { :maximum => 10 }
  validates :name, :presence => true
  # validates :user_id, :presence => true
  
  # Do not include root in json for each individual journal
  # We will wrap all journals in a journal array in the controller
  self.include_root_in_json = false
end
