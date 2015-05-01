class ActivitiesController < ApplicationController
	before_action :get_identity
	before_action :set_activity, only: [:show]
	

	def show
	end

	private
	  def set_activity
	  	if @identity == 0
	  		redirect_to new_participant_registration_path
	  	elsif @identity == 1
	  		@activity = Activity.find(current_participant[:id])
	  	else
	  		@activity = Activity.find(current_organizer[:id])
	  	end
    end

    # def activity_params
    #   params.require(:activity).permit(:name, :time, :creator_id, :place_id, :address, :avg_price, :visibility, :pay_type, :scale, :latitude, :longitude)
    # end
    def get_identity
    	byebug
    	if participant_signed_in?
    		@identity = 1
    	elsif organizer_signed_in?
    		@identity = 2
    	else
    		@identity = 0
    	end
    end
    			

end
