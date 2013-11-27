class SessionsController < ApplicationController
  def login
  end


  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login_attempt
  	authorized_user = User.authenticate(params[:email], params[:login_password])
  	if authorized_user
  		p "authorized_user.id = "
  		p authorized_user.id
  		session[:user_id] = authorized_user.id
  		flash[:notice] = "You are now logged in as #{authorized_user.first_name} #{authorized_user.last_name}"
  		redirect_to(:action => 'profile')
  	else
  		flash[:notice] = "Login unsuccessful"
  		flash[:color]  = "invalid"
  		render "login"
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to :action => 'login'
  end

  def home
  end

  def profile
  end

  def setting
  end
end
