module ApplicationHelper

	def print_multiline(field)
	  field.gsub("\r\n","<br/>").html_safe
	end

	def is_admin
		if current_user == nil
				flash[:notice] = "You must login to access this page!"
				redirect_to login_path
		else
			if current_user.is_admin != "y"
				flash[:notice] = "You must be an admin to access this page!"
				redirect_to root_path
			else
				flash[:notice] = "Have luck admin!"
			end
		end
	end

end
