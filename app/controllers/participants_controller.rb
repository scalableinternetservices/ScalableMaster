class ParticipantsController < ApplicationController


	before_action :set_participant, only: [:show, :cancel_activity, :rejoin_activity, :activities_index, :summary]


	def show
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


  def update
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

  def activities_index
  end

  def summary
    count = @participant.activities.count
    if(count > 8) 
      @activities = @participant.activities[0..7]
    else
      @activities = @participant.activities
    end
    
    @ideas = Idea.where(:participant_id => params[:id])

  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end
