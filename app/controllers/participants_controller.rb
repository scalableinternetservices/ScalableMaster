class ParticipantsController < ApplicationController

	before_action :set_participant, only: [:show, :delete_participant_activity]

	def show
	end

	def delete_participant_activity
		@activity = Activity.find(params[:a_id])
		@activity.participants.delete(@participant)
		@activity.save

		@participant.activities.delete(@activity)
		@participant.save
	end

  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        # format.js
      else
        format.html { render :show }
        # format.j
      end
    end
  end


  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end
