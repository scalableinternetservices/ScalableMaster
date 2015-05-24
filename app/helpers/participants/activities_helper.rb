module Participants::ActivitiesHelper
	def cache_key_for_activities(page)
		count = Activity.count
		max_updated_at = Activity.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"participants-#{page}-activities-#{count}-#{max_updated_at}"
	end
end
