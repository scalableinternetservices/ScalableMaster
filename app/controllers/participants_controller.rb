class ParticipantsController < Participants::BaseController

  def summary
    activities = @participant.activities
    count = activities.length
    if(count > 10) 
      @activities = @participant.activities.limit(9)
    else
      @activities = @participant.activities
    end
    # count = @participant.ideas.count
    @ideas = @participant.ideas.limit(4)
    # count = ideas.length
    # if (count > 10)
    # 	@ideas = @participant.ideas.limit(9)
    # else
    # 	@ideas = @participant.ideas
    # end

  end

end
