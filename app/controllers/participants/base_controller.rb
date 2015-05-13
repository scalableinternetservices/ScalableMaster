class Participants::BaseController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_participant

  private
    def set_participant
      # byebug 
      if participant_signed_in? && 
          current_participant[:id] == params[:participant_id].to_i
        @participant = Participant.find(params[:participant_id])
      elsif participant_signed_in?
        redirect_to participant_root_path
      end
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :avatar)
    end
end
