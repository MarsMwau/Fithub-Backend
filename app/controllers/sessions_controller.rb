class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      expiration_time = Time.now.to_i + 1440 * 60 # 24 hours in seconds
      token = JWT.encode({ user_id: user.id, exp: expiration_time }, ENV['SECRET_KEY'], 'HS256')
      cookies.signed[:jwt] = { value: token, httponly: true, expires: Time.at(expiration_time) }
      render json: { token: token, user: user }
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:jwt)
    head :no_content
  end
end
