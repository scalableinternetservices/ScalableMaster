module Participants::IdeasHelper

  def participant_ideas_or_idea_path(participant, idea)
    if idea.id
      participant_idea_path(participant, idea)
    else 
      participant_ideas_path(participant)
    end
  end

end
