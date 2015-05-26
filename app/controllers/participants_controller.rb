class ParticipantsController < Participants::BaseController

  def summary
    count = @participant.activities.count
    if(count > 10) 
      @activities = @participant.activities.limit(9)
    else
      @activities = @participant.activities
    end
    
    count = @participant.ideas.count
    if (count > 10)
    	@ideas = @participant.ideas.limit(9)
    else
    	@ideas = @participant.ideas
    end

  end

end
