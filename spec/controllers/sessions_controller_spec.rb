require 'spec_helper'
require 'sessions_controller'

describe SessionsController do

	before(:each) do
		#Need to add user to database
		@user = User.new(:email => "connor.boyd@colorado.edu", :password => "password", first_name: "Connor", last_name: "Boyd")
		@user.save
		@user_params = {:email => "connor.boyd@colorado.edu", :login_password => "password" }
		@invalid_params = {:email => "connor.boyd@colorado.edu", :login_password => "wrongpassword" }
	end

	describe "Login Attempt" do
		it "Authenticates the user" do

			post :login_attempt, @user_params
			expect(session[:user_id]).to equal(@user.id)

		end
	end

	describe "Bad Login Attempt" do
		it "Does not authenticate the user if the password is wrong" do

			post :login_attempt, @invalid_params
			expect( session[:user_id]).to equal(nil)

		end
	end

	describe "Logout" do
		it "Logs the user out" do

			post :login_attempt, @user_params
			expect(session[:user_id]).to equal(@user.id)	#user is logged in
			get :logout
			expect( session[:user_id]).to equal(nil)		#user is logged out

		end
	end

end