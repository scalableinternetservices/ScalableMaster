module IdeasHelper
  def cache_key_for_ideas_all(ideas, page)
    count = ideas.count
    max_updated_at = ideas.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "ideas-#{page}-all-#{count}-#{max_updated_at}"
  end

  def cache_key_for_ideas_row(idea, page)
    "ideas-#{page}-row-#{idea.updated_at}-#{idea.id}"
  end
end
