class ExperiencesController < ApplicationController

	def create
		@addexp = Experience.new(params[:experience])

  	 	if @addexp.save
  	 		 redirect_to user_path(current_user.id)
  	 	else
  	 		redirect_to user_path(current_user.id)
  	 	end

	end
	
	def destroy
		
		@delexp = Experience.find(params[:id])
		@delexp.destroy
		redirect_to user_path, :notice => "The information has been successfully updated."
	end

	def update

		@editexp = Experience.find(params[:id])
		if @editexp.update_attributes(params[:experience]) #parameter experience is the singular of experiences table
			puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
			redirect_to user_path(current_user.id), :notice => "The information has been successfully updated."
		else
			render "editexperience"	
		end
	end

end
