class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :authorize, only:[:create,:index,:destroy]

  # GET /users or /users.json
  def index
    user = User.all
    render json: user
  end

  # GET /users/1 or /users/1.json
  def show
    user = User.find(session[:user_id])
    render json: user, status: :ok
  end

  # POST /users or /users.json
  def create
    user = User.create(user_params)
    if user
      render json: user, status: :created
    else
      render json: {error: "Post not created"},status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
  user = User.find_by(id: params[:id])
  if user
    user.destroy
    head :no_content
  else
    render json: {error: "Failed to destroy user"}
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :bio, :profile_pic)
    end
end
