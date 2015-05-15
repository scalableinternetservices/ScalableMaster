class Organizers::ActivitiesController < Organizers::BaseController
  before_action :set_tags, only: [:edit, :create]
  before_action :set_activity, only: [ :edit, :update, :show ]
  def index
  end

  def edit
  end

  def show
    # @organizer = Organizer.find(params[:organizer_id])
    # organizer already set in BaseController
  end

  def new
    @activity = @organizer.activities.new
  end

  def set_tags
    @all_tags = Tag.all
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
      if @activity.update(activity_params) && @activity.update_tags(tags_params)
          format.html { redirect_to :organizer_activity, notice: 'Activity was successfully updated.' }
      else
          format.html { redirect_to :organizer_activity, notice: 'Failed!' }
      end
    end
  end


  private
    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def activity_params
      params.require(:activity).permit(:name, :email, :phone, :address, :img_url, :description, :avatar)
    end

end
