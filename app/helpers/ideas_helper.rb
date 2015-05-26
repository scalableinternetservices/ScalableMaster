module IdeasHelper
  def cache_key_for_ideas_all(ideas)
    max_updated_at = ideas.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "ideas-all-#{max_updated_at}"
  end

  def cache_key_for_ideas_row(idea)
    "ideas-row-#{idea.updated_at}"
  end
end
