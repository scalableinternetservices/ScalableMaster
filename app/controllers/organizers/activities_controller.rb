class Organizers::ActivitiesController < ApplicationController
  before_action :set_activity, only: [
    :activity_edit, :activity_update
  ]
  
  def activities_index
  end

  def activity_edit
  end

  def activity_update
    respond_to do |format|
      if @activity.update(activity_params)
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
      params.require(:activity).permit(:name, :email, :phone, :address, :img_url, :description, :avatar, :avatar_cache, :remove_avatar)
    end
end
