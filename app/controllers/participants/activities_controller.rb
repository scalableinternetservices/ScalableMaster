class Participants::ActivitiesController < ApplicationController

  before_action :set_participant
  before_action :set_activity, only: [ :cancel, :rejoin, :show ]

  def index
  end

  def show

  end

  def cancel
    @activity.participants.delete(@participant)
    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
  end

  def rejoin
    @activity.participants << @participant
    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
  end

  private
    def set_participant
      # byebug
      # @participant = Participant.find(params[:participant_id])
      @participant = Participant.find(current_participant[:id])
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

end
