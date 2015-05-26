class Organizers::ProfileController < Organizers::BaseController
  before_action :set_tags, only: [:edit, :new]

  def show 
    if @organizer.gender == "1"
      @organizer.gender = "Male"
    end
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
    # byebug
    respond_to do |format|
      if @organizer.update(organizer_params) && @organizer.update_tags(tags_params)
        format.html { redirect_to organizer_profile_path(@organizer), notice: 'Organizer was successfully updated.' }
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
      params.require(:organizer).permit(:tag_names)
    end

end
