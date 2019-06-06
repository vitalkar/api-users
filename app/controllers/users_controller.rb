class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save 
      render json: @user, status: 201
    else
      render json: {'error': 'failed to create a new user'}, status: 422
    end
  end

  def show
    if @user.nil?
      head :not_found
    else
      render json: @user, status: 200
    end
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
    def user_params
      params.permit(:username, :password, :email, :birthday)
    end

    def set_user
      @user = User.find(params[:id])
end
end