class HomepageController < ApplicationController

  protect_from_forgery with: :null_session
  def homepage_index

  end


  def homepage_activity   
    lat = params["lat"]
    lng = params["lng"]
    puts lat.nil?
    puts lng.nil?
    if true
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
    else
      @activities = Activity.all
    end

    #respond_to do |format|
    #  format.html { redirect_to action: :homepage_index }
    #  format.js
    #end

  end
    
 


end
