class WeightTrackingsController < ApplicationController
    before_action :set_user
  
    def index
      weight_trackings = @user.weight_trackings.order(:date)
      render json: weight_trackings
    end
    
    def show
      weight_tracking = @user.weight_trackings.find_by(id: params[:id])
      if weight_tracking
        render json: weight_tracking
      else
        render json: { error: 'WeightTracking not found' }, status: :not_found
      end
    end
  
    def create
      weight_tracking = @user.weight_trackings.new(weight_tracking_params)
  
      if weight_tracking.save
        render json: { message: 'Weight tracking was successfully created.', weight_tracking: weight_tracking }, status: :created
      else
        render json: { errors: weight_tracking.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      weight_tracking = @user.weight_trackings.find(params[:id])
  
      if weight_tracking.update(weight_tracking_params)
        render json: weight_tracking
      else
        render json: { errors: weight_tracking.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      weight_tracking = @user.weight_trackings.find(params[:id])
  
      if weight_tracking
        weight_tracking.destroy
        render json: { message: 'Weight tracking was successfully deleted.' }
      else
        render json: { error: 'Weight tracking not found' }, status: :not_found
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def weight_tracking_params
      params.require(:weight_tracking).permit(:weight, :date)
    end
  end
  
