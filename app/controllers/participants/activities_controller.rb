class Participants::ActivitiesController < Participants::BaseController
  before_action :set_activity, only: [ :cancel, :rejoin, :show, :canclejoin, :join ]

  def index
  end

  def show
    @participant = Participant.find(params[:participant_id])
    @hasActivity = @activity.participants.where(id:@participant.id)
  end

  def canclejoin
    @activity.participants.delete(@participant)
    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
  end

  def join
    @activity.participants << @participant
    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
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

    def set_activity
      @activity = Activity.find(params[:id])
    end

    
end
