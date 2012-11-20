class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :journals
  
  self.include_root_in_json = true
end
