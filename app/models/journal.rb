class Journal < ActiveRecord::Base
  attr_accessible :birthdate, :gender, :name, :user_id
  
  belongs_to :user
  
  validates :gender, :length => { :maximum => 10 }
  validates :user_id, :presence => true
end
