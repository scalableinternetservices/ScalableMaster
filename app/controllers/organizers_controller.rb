class OrganizersController < Organizers::BaseController

  def home
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def index
    redirect_to organizer_summary_path(current_organizer[:id])
  end

  def summary
    count = @organizer.activities.count
    if(count > 10) 
      @activities = @organizer.activities.limit(9)
    else
      @activities = @organizer.activities
    end
  
    @ideas = Idea.joins(:tags).where('tags.id IN (?)', @organizer.tags.select(:id)).distinct

  end

end
