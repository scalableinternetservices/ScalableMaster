module ActivitiesHelper
  def cache_key_for_activities_all(activities, page)
    max_updated_at = activities.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "ideas-#{page}-all-#{max_updated_at}"
  end

  def cache_key_for_activities_row(activity, page)
    "ideas-#{page}-row-#{activity.updated_at}"
  end
end
