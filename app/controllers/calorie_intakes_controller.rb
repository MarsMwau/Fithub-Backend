class CalorieIntakesController < ApplicationController

    before_action :set_user

    def index
        calorie_intakes = @user.calorie_intakes.order(:date)
        render json: calorie_intakes
      end
      
      def show
        calorie_intake = @user.calorie_intakes.find_by(id: params[:id])
        if calorie_intake
          render json: calorie_intake
        else
          render json: { error: 'Calorie intake not found' }, status: :not_found
        end
      end
    
      def create
        calorie_intake = @user.calorie_intakes.new(calorie_intake_params)
    
        if calorie_intake.save
          render json: { message: 'Calorie intake was successfully created.', calorie_intake: calorie_intake }, status: :created
        else
          render json: { errors: calorie_intake.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        calorie_intake = @user.calorie_intakes.find(params[:id])
    
        if calorie_intake.update(calorie_intake_params)
          render json: calorie_intake
        else
          render json: { errors: calorie_intake.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        calorie_intake = @user.calorie_intakes.find(params[:id])
    
        if calorie_intake
            calorie_intake.destroy
          render json: { message: 'Calorie intake was successfully deleted.' }
        else
          render json: { error: 'Calorie intake not found' }, status: :not_found
        end
      end
    
      private
    
      def set_user
        @user = User.find(params[:user_id])
      end
    
      def calorie_intake_params
        params.require(:calorie_intake).permit(:calories, :date)
      end

end