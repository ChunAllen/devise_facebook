class UsersController < ApplicationController
	
	def index
		if user_signed_in?
			
 
			#dispaly all users except current user
			@users = User.where("id != ?", current_user.id ).order("fname").paginate(:per_page => 10, :page => params[:page])
			  if request.xhr?
      			sleep(3) # make request a little bit slower to see loader :-)
      			render :partial => @users
    		  end

		else
			redirect_to  new_user_session_path
		end

	end

	

end
