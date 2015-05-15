class Organizers::ActivitiesController < Organizers::BaseController
  require 'open-uri'
  require 'json'

  before_action :set_tags, only: [:edit, :create, :new]
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
    #use this addr to find the city of the activity
    addr = activity_params[:address]

    url_beign = 'https://maps.googleapis.com/maps/api/geocode/json?address='
    url_end = '&key=AIzaSyAEuB0H0PzN0_OHVxZv3XBMOgixjCdRph8'
    url_middle = addr.split(' ').join('+')
    url_all = url_beign + url_middle + url_end

    response = open(url_all).read
    res = JSON.parse(response)
    
    city_hash = {}
    if res["status"] != "ZERO_RESULTS"
      tmp_hash_array = res["results"][0]["address_components"]
      activity_city_name = ""
      tmp_hash_array.each do |x|
        if x["types"][0] == "locality"
          activity_city_name = x["long_name"]
        end
      end
      city_hash[:city_name] = activity_city_name
    else
      city_hash[:city_name] = ""
    end

   
    @activity.update(city_hash) 
    @activity.update_tags(tags_params)

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
    
    #use this addr to find the city of the activity
    addr = activity_params[:address]
    url_beign = 'https://maps.googleapis.com/maps/api/geocode/json?address='
    url_end = '&key=AIzaSyAEuB0H0PzN0_OHVxZv3XBMOgixjCdRph8'
    url_middle = addr.split(' ').join('+')
    url_all = url_beign + url_middle + url_end

    response = open(url_all).read
    res = JSON.parse(response)
    
    city_hash = {}
    if res["status"] != "ZERO_RESULTS"
      tmp_hash_array = res["results"][0]["address_components"]
      activity_city_name = ""
      tmp_hash_array.each do |x|
        if x["types"][0] == "locality"
          activity_city_name = x["long_name"]
        end
      end
      city_hash[:city_name] = activity_city_name
    else
      city_hash[:city_name] = ""
    end

    respond_to do |format|
      if @activity.update(activity_params) && @activity.update_tags(tags_params) && @activity.update(city_hash)
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
      params.require(:activity).permit(:name, :email, :phone, :address, :img_url, :description, :avatar, :avatar_cache, :remove_avatar, :city_name)
    end

    def tags_params
      params.require(:activity).permit(:tag_names)
    end

end
