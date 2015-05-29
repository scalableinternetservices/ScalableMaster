class HomepageController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  def index
    if participant_signed_in?
      @participant = Participant.find(current_participant[:id])
    end

    if session[:last_seen].nil?
      session[:last_seen] = Time.now
    end

    if not session[:city_name].nil? && Time.now - Time.parse(session[:last_seen].to_s) < 30.minutes
      redirect_to homepage_activity_url
    end

  end

  def homepage_index
    # @participant = Participant.find(params[:participant_id])
    if participant_signed_in?
      @participant = Participant.find(current_participant[:id])

      # ul = Userlocation.find_by :user_id => current_participant[:id]
      # if not (ul.nil? or Time.now - ul.updated_at > 30.minutes)
      #   redirect_to homepage_activity_url
      # end
    end

    if session[:last_seen].nil?
      session[:last_seen] = Time.now
    end

    if not session[:city_name].nil? && Time.now - Time.parse(session[:last_seen].to_s) < 30.minutes
      redirect_to homepage_activity_url
    end

  end

  def homepage_activity
    if session[:last_seen].nil?
      session[:last_seen] = Time.now
    end

    if not session[:city_name].nil? && Time.now - Time.parse(session[:last_seen].to_s) < 30.minutes
      @city_name = session[:city_name]
      user_city_name = session[:city_name]
    else
      user_city_name = ""
      lat = params["lat"]
      lng = params["lng"]
      puts lat.nil?
      puts lng.nil?
      
      string_geocode = lat.to_s + "," + lng.to_s
      location = Geocoder.search(string_geocode)
      tmp_hash_array = location[0].data["address_components"]
      
      # puts tmp_hash_array
      
      tmp_hash_array.each do |x|
        if x["types"][0] == "locality"
          user_city_name = x["long_name"]
          session[:city_name] = user_city_name
          session[:last_seen] = Time.now
          @city_name = user_city_name
        end
      end
    end

    if participant_signed_in?
      # user_city_name = ""
      # ul = Userlocation.find_by :user_id => current_participant[:id]

      # if ul.nil? or Time.now - ul.updated_at > 30.minutes

      #   lat = params["lat"]
      #   lng = params["lng"]
      #   puts lat.nil?
      #   puts lng.nil?
        
      #   string_geocode = lat.to_s + "," + lng.to_s
      #   location = Geocoder.search(string_geocode)
      #   tmp_hash_array = location[0].data["address_components"]
        
      #   # puts tmp_hash_array
        
      #   tmp_hash_array.each do |x|
      #     if x["types"][0] == "locality"
      #       user_city_name = x["long_name"]
      #     end
      #   end
      #   # puts user_city_name

      # else
      #   user_city_name = ul.location
      # end

      #store back the data
      # if ul.nil?
      #   ul = Userlocation.new
      #   ul.location = user_city_name
      #   ul.updated_time = Time.now
      #   ul.user_id = current_participant[:id]
      #   ul.save
      # else
      #   ul.location = user_city_name
      #   ul.updated_time = Time.now
      #   ul.save
      # end

      # @city_name = user_city_name

      @participant = Participant.find(current_participant[:id])
      participant_tags_id = @participant.tags.select(:id)
      @ideas = Idea.joins(:tags).where('tags.id IN (?)', participant_tags_id).distinct
      @activities = Activity.joins(:tags).where('tags.id IN (?)', participant_tags_id)
      @activities = @activities.where('city_name IN (?)', user_city_name).distinct.paginate(page: params[:page], per_page: 16)
    end

    if @activities.nil? || @activities.length == 0
      @activities = Activity.all.paginate(page: params[:page], per_page: 16)
    end

    if @ideas.nil? || @ideas.length == 0
      @ideas = Idea.all
    end

  end

end
