class Organizers::ProfileController < Organizers::BaseController
  def show 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to organizer_profile_path(@organizer), notice: 'Organizer was successfully updated.' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end
end
