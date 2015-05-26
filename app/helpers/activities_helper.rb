module ActivitiesHelper
  def cache_key_for_activities_all(activities)
    max_updated_at = activities.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "ideas-all-#{max_updated_at}"
  end

  def cache_key_for_activities_row(activity)
    "ideas-row-#{activity.updated_at}"
  end
end
