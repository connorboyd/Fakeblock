class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :save_login_state, :only => [:new, :create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = User.find_all_by_last_name(params[:search])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def profile
    @user   = User.find(params[:id])
    @books  = Book.find_by_user_id(params[:id])
    @movies = Movie.find_by_user_id(params[:id])
    @music  = Music.find_by_user_id(params[:id])

    # @myPosts  = Post.find_all_by_user_id(params[:id])

    @myPosts  = Post.where(user_id: params[:id]).take(10)

    # @postsOnMyWall = Post.find_all_by_on_wall_of_user(params[:id])

    @postsOnMyWall = Post.where(on_wall_of_user: params[:id]).take(10)

    @allPosts = @myPosts.zip(@postsOnMyWall).flatten.sort_by!{|post| :created_at}.compact
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def search
    @users = Users.search params[:search]
  end

  # POST /users
  # POST /users.json
  def create
    if(user_params[:password] == user_params[:password_confirmation])
      @user = User.new(user_params)

    else
      #Passwords do not match! What to do here?
    end

    respond_to do |format|
      if @user.save
        @books = Book.new("").save
        @movies = Movie.new("").save
        @music = Music.new("").save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:last_name] || params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :email, :first_name, :last_name, :password, :password_confirmation)
    end
  end
