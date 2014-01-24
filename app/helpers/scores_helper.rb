module ScoresHelper
	def recent_call_num(id)
		u=User.find(id)
		if u.scores.last!=nil and u.scores.last.num_wins==nil
			return u.scores.last.num_calls
		end
		return "unknown"
	end
end
