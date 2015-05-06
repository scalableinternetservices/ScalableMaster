class Participants::ProfileController < Participants::BaseController

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
      if @participant.update(participant_params)
        format.html { redirect_to participant_profile_path(@participant), 
                      notice: 'Participant was successfully updated.' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end

end
