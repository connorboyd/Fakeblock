class UserInfosController < ApplicationController
  before_action :set_user_info, only: [:show, :edit, :update, :destroy]

  # GET /user_infos
  # GET /user_infos.json
  def index
    @user_infos = UserInfo.all
  end

  # GET /user_infos/1
  # GET /user_infos/1.json
  def show
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new

  end

  # GET /user_infos/1/edit
  def preferences
    authenticate_user
    @user   = User.find(params[:id])
    @books  = Book.find_by_user_id(params[:id])
    if (@books == nil)
      @books = Book.new(:user_id => @current_user.id, :book_names => "").save
    end
    @movies = Movie.find_by_user_id(params[:id])
    if (@movies == nil)
      @movies = Movie.new(:user_id => @current_user.id, :movie_names => "").save
    end
    @music  = Music.find_by_user_id(params[:id])
    if (@music == nil)
      @music = Music.new(:user_id => @current_user.id, :artists => "").save
    end

      @user_info = UserInfo.find_by_user_id(session[:user_id])
      if (@user_info == nil)
        @user_info = UserInfo.new(:user_id =>session[:user_id]).save
        if @user_info.hometown == nil
          @user_info.hometown = ""
        end
        if @user_info.birthday == nil
          @user_info.birthday = ""
        end
        if @user_info.school == nil
          @user_info.school = ""
        end
        if @user_info.job == nil 
          @user_info.job = ""
        end
        if @user_info.quotes == nil
          @user_info.quotes = ""
        end
      end
    @pending_friends = PendingFriendRequest.where(to_user_id: session[:user_id]).where.not(from_user_id: @current_user.get_friends_ids)
    @wall_posts = Post.where(on_wall_of_user: session[:user_id])
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @user_info = UserInfo.new(user_info_params)

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_info }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_infos/1
  # PATCH/PUT /user_infos/1.json
  def update
    respond_to do |format|
      if @user_info.update(user_info_params)
        format.html { redirect_to '/profile?id=%s' % [session[:user_id]], notice: 'User info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
      @user_info = UserInfo.find_by_user_id(session[:user_id])
      if (@user_info == nil)
        @user_info = UserInfo.new(:user_id =>session[:user_id]).save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_info_params
      params.require(:user_info).permit(:user_id, :hometown, :birthday, :school, :job, :quotes)
    end
end
