class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show]

	def show
	end

	private
	  def set_activity
      @activity = Activity.find(params[:id])
    end

    # def activity_params
    #   params.require(:activity).permit(:name, :time, :creator_id, :place_id, :address, :avg_price, :visibility, :pay_type, :scale, :latitude, :longitude)
    # end

end
