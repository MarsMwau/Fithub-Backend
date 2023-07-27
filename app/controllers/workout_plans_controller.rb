class WorkoutPlansController < ApplicationController
  
        def index
          workout_plans = WorkoutPlan.all
          render json: workout_plans
        end

        def show
                  workout_plan = WorkoutPlan.find(params[:id])
                  render json: workout_plan
        end
      
        def create
          workout_plan = WorkoutPlan.new(workout_plan_params)
        
          if workout_plan.save
            render json: workout_plan
          else
            render json: { errors: workout_plan.errors.full_messages }
          end
        end
        
        def update
          workout_plan = WorkoutPlan.find(params[:id])

          if workout_plan.update(workout_plan_params)
            render json: workout_plan
            else
              render json: { errors: workout_plan.errors.full_messages }
            end
        end

        def destroy
          workout_plan = WorkoutPlan.find(params[:id])
          workout_plan.destroy
          render json: workout_plan
        end

        private
        
        def workout_plan_params
          params.require(:workout_plan).permit(:exercise_id, :user_id, :date)
        end
end
