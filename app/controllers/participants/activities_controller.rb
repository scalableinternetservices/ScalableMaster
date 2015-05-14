class Participants::ActivitiesController < Participants::BaseController
  before_action :set_activity, only: [ :show, :canclejoin, :join ]

  def index
  end

  def show
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

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end
    
end
