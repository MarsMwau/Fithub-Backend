class WorkoutPlansController < ApplicationController
  before_action :set_user
  
  def index
    workout_plans = current_user.workout_plans.includes(:exercises)
    render json: workout_plans.to_json(include: :exercises)
  end
  
  def show
    workout_plan = current_user.workout_plans.find(params[:id])
    render json: workout_plan.to_json(include: :exercises)
  end  

  def create
    workout_plan = current_user.workout_plans.build(workout_plan_params)
  
    exercises = Exercise.where(id: params[:exercise_ids])
  
    workout_plan.exercises << exercises
  
    if workout_plan.save
      render json: { message: "Workout plan was successfully created.", workout_plan: workout_plan, exercises: workout_plan.exercises }, status: :created
    else
      render json: { errors: workout_plan.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_exercise
    workout_plan = current_user.workout_plans.find(params[:id])
    exercise = Exercise.find(params[:exercise_id])

    if workout_plan && exercise
      workout_plan.exercises << exercise
      render json: { message: "Exercise added to workout plan successfully" }
    else
      render json: { error: "Exercise or workout plan not found" }, status: :not_found
    end
  end
  

  def remove_exercise
    workout_plan = current_user.workout_plans.find(params[:id])
    exercise = Exercise.find(params[:exercise_id])

    if workout_plan && exercise
      workout_plan.exercises.delete(exercise)
      render json: { message: "Exercise removed from workout plan successfully" }
    else
      render json: { error: "Exercise or workout plan not found" }, status: :not_found
    end
  end

  def destroy
    workout_plan = current_user.workout_plans.find(params[:id])

    if workout_plan
      exercises = workout_plan.exercises

      workout_plan.destroy

      render json: { message: "Workout plan and associated exercises have been deleted successfully" }
    else
      render json: { error: "Workout plan not found" }, status: :not_found
    end
  end


  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    render json: { error: 'User not found' }, status: :not_found unless @user
  end
  

  def workout_plan_params
    params.require(:workout_plan).permit(:date, exercise_ids: [])
  end

end
