class Post < ActiveRecord::Base
  attr_accessible :description, :journal_id, :picture
  
  belongs_to :post
  
  validates :description, :length => { :maximum => 140 }
  validates :journal_id, :presence => true
end
