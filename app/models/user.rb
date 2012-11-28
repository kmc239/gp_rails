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
  
  # Server-side validation. Validation also occurs client-side.
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :password, :length => { :minimum => 6 }

  # Include root in json for each individual user.
  # We know users will only be fetched individually, 
  # so this will not affect any getUsers calls
  self.include_root_in_json = true
  
  def self.authenticate(email, password)
  
    user = User.find_by_email(email)
    
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
    
end
