module Participants::IdeasHelper
	def cache_key_for_ideas
		count = Idea.count
		max_updated_at = Idea.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"participants-summary-ideas-#{count}-#{max_updated_at}"
	end
end
