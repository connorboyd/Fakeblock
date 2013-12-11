require 'spec_helper'
require 'users_controller'

describe UsersController do

	before(:each) do
		@user_params = {:email => "email@testemail.com",:first_name => "jane",:last_name => "doe",:password => "test"}
	end

	describe "POST create" do
		it "assigns a new user @user" do
			user = User.new(@user_params)
			expect(response.status).to eq(200)
		end
	end

	it "should require an email address" do
		blank = User.new(@user_params.merge(:email => ""))
		blank.should_not be_valid
	end

	it "should not accept a duplicate email" do
		User.create(@user_params)
		email = User.new(@user_params)
		email.should_not be_valid
	end
	
	before(:each) do
		@user = User.create(@user_params)
	end
	
	describe "PUT update" do

		it "updates a user @user" do
			@user.update(:first_name => "Jane")
			expect(response.status).to eq(200)
		end
	end

	describe "Delete destroy" do
		it "should delete a user @user" do
			@user.destroy
			expect(response.status).to eq(200)
		end
	end
end