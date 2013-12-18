class UserFriendRelationsController < ApplicationController
  before_action :set_user_friend_relation, only: [:show, :edit, :update, :destroy]

  # GET /user_friend_relations
  # GET /user_friend_relations.json
  def index
    @user_friend_relations = UserFriendRelation.all
  end

  # GET /user_friend_relations/1
  # GET /user_friend_relations/1.json
  def show
  end

  # GET /user_friend_relations/new
  def new
    @user_friend_relation = UserFriendRelation.new
  end

  # GET /user_friend_relations/1/edit
  def edit
  end

  def delete_friend
    @user1 = user_friend_relation_params[:user_id1]
    @user2 = user_friend_relation_params[:user_id2]

    UserFriendRelation.delete_all(user_id1: @user1, user_id2: @user2)
    UserFriendRelation.delete_all(user_id1: @user2, user_id2: @user1)
    redirect_to '/profile'
  end

  # POST /user_friend_relations
  # POST /user_friend_relations.json
  def create
    @user_friend_relation = UserFriendRelation.new(user_friend_relation_params)

    @user1 = user_friend_relation_params[:user_id1]
    @user2 = user_friend_relation_params[:user_id2]

    PendingFriendRequest.delete_all(from_user_id: @user1, to_user_id:   @user2)
    PendingFriendRequest.delete_all(to_user_id:   @user2, from_user_id: @user1)

    respond_to do |format|
      if @user_friend_relation.save
        format.html { redirect_to '/profile?id=%s' % [session[:user_id]], notice: 'User friend relation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_friend_relation }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_friend_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_friend_relations/1
  # PATCH/PUT /user_friend_relations/1.json
  def update
    respond_to do |format|
      if @user_friend_relation.update(user_friend_relation_params)
        format.html { redirect_to @user_friend_relation, notice: 'User friend relation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_friend_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_friend_relations/1
  # DELETE /user_friend_relations/1.json
  def destroy
    @user_friend_relation.destroy
    respond_to do |format|
      format.html { redirect_to user_friend_relations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_friend_relation
      @user_friend_relation = UserFriendRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_friend_relation_params
      params.require(:user_friend_relation).permit(:user_id1, :user_id2)
    end
end
