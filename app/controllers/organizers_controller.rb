class OrganizersController < ApplicationController
  
  before_action :set_organizer, only: [:summary]

  def summary
    count = @organizer.activities.count
    if(count > 8) 
      @activities = @organizer.activities[0..7]
    else
      @activities = @organizer.activities
    end
    

  end

  private
    def set_organizer
      @organizer = Organizer.find(params[:organizer_id])
    end

    def organizer_params
      params.require(:organizer).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end

end
