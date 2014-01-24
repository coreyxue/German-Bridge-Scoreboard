module UsersHelper
	def current_user
		if session[:remember_token]!=nil
			User.find(session[:remember_token])
		end
	end

	def admin?
		if session[:remember_token]!=nil
			User.find(session[:remember_token]).admin
		end
	end

end