require 'spec_helper'
require 'users_controller'

describe UsersController do

	let(:user_id) {{"user_id" => "1"}}
	let(:user_params) {{"email" => "email"}}

	describe "POST create" do
		it "assigns a new user @user" do
			user = User.new
		end
	end

	describe "PUT update" do
		it "updates a user @user" do
			user = User.update(1,1)
		end
	end
end