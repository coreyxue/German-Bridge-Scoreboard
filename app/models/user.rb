class User < ActiveRecord::Base
  attr_accessible :admin, :name, :total
  has_many :scores

  validates :name, presence: true

  def get_total
  	self.scores.each do |s|
  		self.total += s.record
  	end
  end

end
