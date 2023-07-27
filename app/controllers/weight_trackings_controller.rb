class WeightTrackingsController < ApplicationController
    before_action :set_weight, only: [:show, :update, :destroy]

    def show
        render json: @weight, except: [:created_at, :updated_at, :id]
    end

    def create
        weight = WeightTracking.new(weight_params)
        if weight.save
            render json: weight, status: :created
        else
            render json: { errors: weight.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @weight.update(weight_params)
            render json: @weight, status: :ok
        else
            render json: { errors: @weight.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        if @weight
            @weight.destroy
            head :no_content
        else
            render json: { errors: ['Cannot delete weight'] }
        end
    end

    private
    def set_weight
        @weight = WeightTracking.find(params[:id])
    end

    def weight_params
        params.require(:weight_tracking).permit(:user_id, :weight, :date)
    end
end
