class User < ActiveRecord::Base
  attr_accessible :admin, :name, :total, :history_id
  has_many :scores
  belongs_to :history

  validates :name, presence: true

  def get_total
  	self.scores.each do |s|
  		self.total += s.record
  	end
  end

end
