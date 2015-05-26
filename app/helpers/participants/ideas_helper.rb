module Participants::IdeasHelper
	def cache_key_for_summary_ideas
		four_ideas = Idea.limit(4)
		max_updated_at = four_ideas.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"participants-summary-ideas-4-#{max_updated_at}"
	end

	def cache_key_for_idea_ideas(ideas)
		count = ideas.length
		max_updated_at = ideas.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"participants-idea-ideas-4-#{max_updated_at}"
	end
end
