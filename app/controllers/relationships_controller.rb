class RelationshipsController < ApplicationController
	
	def index
		
		@showfollowing = User.where("id != ?", current_user.id ).order("fname").paginate(:per_page => 1, :page => params[:page])
		if request.xhr?
      		sleep(3) # make request a little bit slower to see loader :-)
      		render :partial => @showfollowing
    	end

	end

	

end
