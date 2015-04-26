class OrganizersController < ApplicationController
  before_action :set_organizer, only: [
    :profile_show, :profile_update, 
    :activities_index
  ]
  before_action :set_activity, only: [
    :activity_edit, :activity_update
  ]

  def profile_show 
  end

  def profile_update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to @organizer, notice: 'Organizer was successfully updated.' }
        # format.js
      else
        format.html { render :show }
        # format.js
      end
    end
  end

  def activities_index
  end

  def activity_edit
  end

  def activity_update
    respond_to do |format|
      if @activity.update(activity_params)
          format.html { redirect_to :organizer_activity, notice: 'Activity was successfully updated.' }
      else
          format.html { render :show }
      end
    end
  end


  private
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    def organizer_params
      params.require(:organizer).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def activity_params
      params.require(:activity).permit(:name, :email, :phone, :address, :img_url, :description)
    end
end
