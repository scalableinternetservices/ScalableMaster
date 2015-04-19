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

	private
	def set_participant
        @participant = Participant.find(params[:id])
    end

end
