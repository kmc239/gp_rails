# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  has_secure_password
  has_many :journals
  
  # Include root in json for each individual user.
  # We know users will only be fetched individually, 
  # so this will not affect any getUsers calls
  self.include_root_in_json = true
end
