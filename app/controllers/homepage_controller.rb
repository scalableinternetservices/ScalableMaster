class HomepageController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  def index
  end

  def homepage_index
    # @participant = Participant.find(params[:participant_id])
    @participant = Participant.find(current_participant[:id])
  end


  def homepage_activity   
    lat = params["lat"]
    lng = params["lng"]
    puts lat.nil?
    puts lng.nil?

    @participant = Participant.find(current_participant[:id])

    
	  puts "You get into the loop"
    string_geocode = lat.to_s + "," + lng.to_s
    location = Geocoder.search(string_geocode)
    tmp_hash_array = location[0].data["address_components"]

    puts tmp_hash_array
    user_city_name = ""
    tmp_hash_array.each do |x|
      if x["types"][0] == "locality"
	      user_city_name = x["long_name"]
      end
    end
    puts user_city_name
    @activities = Activity.where(:city_name => user_city_name)
      #@activities = []
      #@activities << Activity.all[0]
    if @activities.nil? || @activities.length==0
      @activities = Activity.all
    end


    @ideas = Idea.all



    #respond_to do |format|
    #  format.html { redirect_to action: :homepage_index }
    #  format.js
    #end
  
  end

end
