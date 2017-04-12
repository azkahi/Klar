class SessionsController < ApplicationController
	def new
		if (params[:session])
			user = User.find_by(email: params[:session][:email].downcase)
			if user && user.authenticate(params[:session][:password])
				
				log_in user
				redirect_to articles_path
	      		# Log the user in and redirect to the user's show page.
	      	else      		# Create an error message.
	      		flash[:notice] = 'Invalid email/password combination' # Not quite right!
	      		render 'new'
	      	end
	    end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			
			log_in user
			redirect_to articles_path
      		# Log the user in and redirect to the user's show page.
      	else      		# Create an error message.
      		flash[:notice] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
      	end
    end

    def destroy
      	log_out
      	redirect_to login_url
    end
end
