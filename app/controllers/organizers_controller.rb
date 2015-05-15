class OrganizersController < Organizers::BaseController

  def home
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def index
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def summary
    count = @organizer.activities.count
    if(count > 8) 
      @activities = @organizer.activities[0..7]
    else
      @activities = @organizer.activities
    end
    @ideas = Idea.all
    
  end

end
