class ParticipantsController < Participants::BaseController

  def summary
    count = @participant.activities.count
    if(count > 8) 
      @activities = @participant.activities[0..9]
    else
      @activities = @participant.activities
    end
    
    @ideas = @participant.ideas

  end

end
