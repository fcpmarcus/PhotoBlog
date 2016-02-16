class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log in the user and redirect to the user show page
  	else
  		flash[:danger] = 'Wrong email/password combination'
  		render 'new'
  	end
  end

  def destroy
  end
end
