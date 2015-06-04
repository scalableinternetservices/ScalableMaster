class ActivitiesController < ApplicationController
  
	def show
    if participant_signed_in?
      redirect_to participant_activity_path(current_participant[:id], params[:id])
    elsif organizer_signed_in?
      redirect_to organizer_activity_path(current_organizer[:id], params[:id])
    else
      redirect_to new_participant_session_path
    end
	end

end
