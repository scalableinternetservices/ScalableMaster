class OrganizerActivitiesController < ApplicationController
	before_action :set_organizer, only: [:show]

	def show
	end

	private
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end
end
