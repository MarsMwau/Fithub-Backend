class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      token = JWT.encode({ user_id: user.id }, ENV['SECRET_KEY'], 'HS256') 
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users, include: [:weight_trackings, :workout_plans]
  end

  def show
    user = User.includes(:workout_plans => :exercise).find(params[:id])
    render json: user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :age, :gender, :height, :initial_weight, :target_weight)
  end
  
end


