class History < ActiveRecord::Base
  attr_accessible :on, :end
  has_many :users
  has_many :scores, :through => :users 
end
