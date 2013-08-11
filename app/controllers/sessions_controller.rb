class SessionsController < ApplicationController
  def create
    user = User.find_by_login_name(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid Username/Password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
