class ExercisesController < ApplicationController

    def index
        @exercises = Exercise.all
        render json: @exercises
    end

    def show
        @exercise = Exercise.find(params[:id])
        render json: @exercise
    end

    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            render json: @exercise, status: :created
        else
            render json: @exercise.errors, status: :unprocessable_entity
        end
    end

    def update
        @exercise = Exercise.find(params[:id])
        if @exercise.update(exercise_params)
            render json: @exercise
        else
            render json: @exercise.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @exercise = Exercise.find(params[:id])
        @exercise.destroy
        head :no_content
    end

    private
    def exercise_params
        params.require(:exercise).permit(:exercise_name, :image, :exercise_type, :body_part, :duration, :sets, :reps, :status, :calories_burned)
    end

end
