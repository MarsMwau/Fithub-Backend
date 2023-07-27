
class JwtAuthentication
    def initialize(app)
      @app = app
    end
  
    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.headers['Authorization'].present?
        token = request.headers['Authorization'].split(' ').last
        begin
          payload = JwtToken.decode(token)
          user = User.find_by(id: payload['user_id'])
          env['current_user'] = user if user
        rescue JWT::DecodeError
          # Handle invalid or expired token
        end
      end
  
      @app.call(env)
    end
  end
  