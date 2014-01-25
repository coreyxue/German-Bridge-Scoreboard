module UsersHelper
	def current_user
		if session[:remember_token]!=nil
			User.find(session[:remember_token])
		end
	end

	def admin?
		if session[:remember_token]=="check!"
			return true
		end
		return false
	end

	def start_recording?
		return session['history']=='on'
	end

end