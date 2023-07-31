class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authenticate_user, except: [:new, :create]
  
  def current_user
    return unless bearer_token
    
    token = bearer_token
    secret_key = ENV['SECRET_KEY']
    payload = JWT.decode(token, secret_key, true, { algorithm: 'HS256' })
    @current_user ||= User.find_by(id: payload[0]['user_id'])
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
  
  def authenticate_user
    render json: { errors: ['Unauthorized'] }, status: :unauthorized unless current_user
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end
end