class Organizers::ActivitiesController < ApplicationController

  before_action :set_organizer, only: [ :index ]

  def index
  end

  private
    def set_organizer
      @organizer = Organizer.find(params[:organizer_id])
    end
    
end
