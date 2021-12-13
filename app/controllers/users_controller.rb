class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    render json: { usres: @users }
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'SUCCESS', user: @user }
    else
      render json: { status: 'ERROR', user: @user.errors }
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render json: { status: 'SUCCESS', user: @user }
    else
      render json: { status: 'ERROR', user: @user.errors }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    render json: { status: 'SUCCESS DELETED', user: @user }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :age)
    end
end
