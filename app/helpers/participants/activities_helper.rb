module Participants::ActivitiesHelper
	def cache_key_for_activities
		count = Activity.count
		max_updated_at = Activity.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"participants-summary-activities-#{count}-#{max_updated_at}"
	end
end
