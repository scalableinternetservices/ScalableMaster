class ParticipantActivitiesController < ApplicationController
  before_action :set_participant, only: [:show]

  def show
  end

  private
  	def set_participant
  	@participant = Participant.find(params[:id])
  end
end
