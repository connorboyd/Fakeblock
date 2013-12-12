require 'spec_helper'
require 'posts_controller'

describe PostsController do
	
	before(:each) do
		@post_params = {:post_id => '1', :user_id => '1', :time_posted => '12:43', :status => "testing", :on_wall_of_user => "2"}
	end
	
	describe "GET create" do
		it "creates a new post @post" do
			post = Post.new(@post_params)
			expect(response.status).to eq(200)
		end
	end

	before(:each) do
		@post = Post.new(@post_params)
	end

	describe "PUT update" do
		it "updates a post @post" do
			@post.update(:status => "test different")
			expect(response.status).to eq(200)
		end
	end

	describe "DELETE destroy" do
		it "deletes a post @post" do
			@post.destroy
			expect(response.status).to eq(200)
		end
	end
end