module ActivitiesHelper
  def cache_key_for_activities_all(activities, page)
    # count = activities.count
    # max_updated_at = activities.maximum(:updated_at).try(:utc).try(:to_s, :number)
    # "activities-#{page}-all-#{count}-#{max_updated_at}"

    ids = activities.map(&:id).join('-')
    max_updated_at = activities.map(&:updated_at).max
    "activities-#{page}-all-#{max_updated_at}-#{ids}"
  end

  def cache_key_for_activities_row(activity, page)
    "activities-#{page}-row-#{activity.updated_at}-#{activity.id}"
  end
end