class SessionsController < ApplicationController
	
	def new
	end

#for the previous form_for
=begin
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			flash[:success] = "Welcome!"
			redirect_to user
		else
			flash.now[:error]= "Invalid email/password combination"
			render 'new'
		end
	end
=end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			sign_in user
			flash[:success] = "Welcome!"
			redirect_back_or user
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
 