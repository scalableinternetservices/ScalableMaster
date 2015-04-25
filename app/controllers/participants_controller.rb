class ParticipantsController < ApplicationController

	before_action :set_participant, only: [
    :profile_show, :profile_update, 
    :cancel_activity, :rejoin_activity,
    :activities_index
  ]

	def profile_show
	end

  def profile_update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        # format.js
      else
        format.html { render :show }
        # format.js
      end
    end
  end

  def cancel_activity
    @activity = Activity.find(params[:activity_id])
    @activity.participants.delete(@participant)

    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
  end

  def rejoin_activity
    @activity = Activity.find(params[:activity_id])
    @activity.participants << @participant

    respond_to do |format|
      format.html { redirect_to action: :show }
      format.js
    end
  end

  def activities_index
  end

  def ideas_index

  end

  def ideas_new

  end

  def idea_show

  end

  def idea_edit

  end


  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end
