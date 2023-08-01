class CalorieIntakesController < ApplicationController
    before_action :find_user
  
    # GET /calorie_intakes/:user_id
    def index
      calorie_intakes = @user.calorie_intakes
      render json: calorie_intakes, status: :ok
    end
  
    # POST /users/:user_id/calorie_intakes
    def create
      calorie_intake = @user.calorie_intakes.new(calorie_intake_params)
  
      if calorie_intake.save
        render json: { message: 'Calorie intake was successfully created.', calorie_intake: calorie_intake }, status: :created
      else
        render json: { errors: calorie_intake.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def find_user
      @user = User.find(params[:user_id])
    end
  
    def calorie_intake_params
      params.require(:calorie_intake).permit(:calorie_intake, :date)
    end
  end
  