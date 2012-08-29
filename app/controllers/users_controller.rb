class UsersController < ApplicationController
	
	def index
		if user_signed_in?
		
		


		else
			redirect_to  new_user_session_path
		end
	end

	def show
		
		@addexp = Experience.new
		@showexp = Experience.find(:all, :select => 'id,title, company, description, location,from_month, to_month, from_year, to_year ', :conditions => {:user_id => current_user.id})
	end

	
	def editexperience
		@editexp = Experience.find(params[:id])
	end

	
	

end
