class Organizers::BaseController < ApplicationController
  before_action :authenticate_organizer!
  before_action :set_organizer

  private
    def set_organizer
      # byebug
      if organizer_signed_in? && 
        current_organizer[:id] == params[:organizer_id].to_i
          @organizer = Organizer.find(params[:organizer_id])
      elsif organizer_signed_in?
        redirect_to organizer_summary_path(current_organizer[:id])
      end
    end

    def organizer_params
      params.require(:organizer).permit(:name, :nickname, :gender, :age, :phone, :address, :avatar)
    end
end
