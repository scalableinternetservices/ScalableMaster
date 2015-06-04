class OrganizersController < Organizers::BaseController

  def home
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def index
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def summary
    # activities = @organizer.activities
    # count = activities.length
    # if(count > 10) 
    #   @activities = @organizer.activities.limit(9)
    # else
    #   @activities = @organizer.activities
    # end
    @activities = @organizer.activities.limit(9)
  
    @ideas = Idea.joins(:tags).where('tags.id IN (?)', @organizer.tags.select(:id)).distinct.limit(4)

  end

end
