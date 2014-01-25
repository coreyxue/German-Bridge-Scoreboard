class Score < ActiveRecord::Base
  attr_accessible :num_calls, :num_wins, :record, :user_id, :set_call, :set_win, :history_id
  belongs_to :user
  belongs_to :history
end
