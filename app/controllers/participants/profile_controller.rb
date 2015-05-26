class Participants::ProfileController < Participants::BaseController
  before_action :set_tags, only: [:edit, :new]

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
      if @participant.update(participant_params) && @participant.update_tags(tags_params)
        format.html { redirect_to participant_profile_path(@participant), 
                      notice: 'Participant was successfully updated.' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end

  private
    def set_tags
        @all_tags = Tag.all
      end

    def tags_params
      params.require(:participant).permit(:tag_names)
    end

end
