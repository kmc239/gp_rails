class Journal < ActiveRecord::Base
  attr_accessible :birthdate, :gender, :name, :user_id
  
  belongs_to :user
  has_many :posts
  
  validates :gender, :length => { :maximum => 10 }
  validates :user_id, :presence => true
  
  self.include_root_in_json = true
end
