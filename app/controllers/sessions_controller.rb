class SessionsController < ApplicationController
  def login
  end


  before_filter :authenticate_user, :only => [:home, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login_attempt
  	authorized_user = User.authenticate(params[:email], params[:login_password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		flash[:notice] = "You are now logged in as #{authorized_user.first_name} #{authorized_user.last_name}"
  		redirect_to("/newsfeed")
  	else
  		flash[:alert] = "Login unsuccessful!"
  		flash[:color]  = "invalid"
  		render "login"
  	end
  end

  def logout
  	session[:user_id] = nil
    # flash[:notice] = "You have logged out"
  	redirect_to :action => 'login'
  end

  def home
  end

  def setting
  end
end
