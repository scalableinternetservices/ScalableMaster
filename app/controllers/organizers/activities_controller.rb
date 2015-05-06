class Organizers::ActivitiesController < Organizers::BaseController

  def index
  end

  def edit
  end

  def new
    @activity = @organizer.activities.new
  end


  def create
    @activity = @organizer.activities.create(activity_params)
    respond_to do |format|
      if @activity
        format.html { redirect_to organizer_activity_path(@organizer, @activity), notice: 'Activity was successfully created.' }
        #format.js
      else
        format.html { render :new }
        #format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
          format.html { redirect_to :organizer_activity, notice: 'Activity was successfully updated.' }
      else
          format.html { redirect_to :organizer_activity, notice: 'Failed!' }
      end
    end
  end


  

end
