class PendingFriendRequestsController < ApplicationController
  before_action :set_pending_friend_request, only: [:show, :edit, :update, :destroy]

  # GET /pending_friend_requests
  # GET /pending_friend_requests.json
  def index
    @pending_friend_requests = PendingFriendRequest.all
  end

  # GET /pending_friend_requests/1
  # GET /pending_friend_requests/1.json
  def show
  end

  # GET /pending_friend_requests/new
  def new
    @pending_friend_request = PendingFriendRequest.new
  end

  # GET /pending_friend_requests/1/edit
  def edit
  end


  # POST /pending_friend_requests
  # POST /pending_friend_requests.json
  def create
    @pending_friend_request = PendingFriendRequest.new(pending_friend_request_params)

    respond_to do |format|
      if @pending_friend_request.save
        format.html { redirect_to '/profile', notice: 'Friend request sent!' }
        format.json { render action: 'show', status: :created, location: @pending_friend_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @pending_friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_friend_requests/1
  # PATCH/PUT /pending_friend_requests/1.json
  def update
    respond_to do |format|
      if @pending_friend_request.update(pending_friend_request_params)
        format.html { redirect_to @pending_friend_request, notice: 'Pending friend request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pending_friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_friend_requests/1
  # DELETE /pending_friend_requests/1.json
  def destroy
    @pending_friend_request.destroy
    respond_to do |format|
      format.html { redirect_to '/profile?id=%s' % [session[:user_id]] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_friend_request
      @pending_friend_request = PendingFriendRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_friend_request_params
      params.require(:pending_friend_request).permit(:from_user_id, :to_user_id, :date_requested)
    end
end
