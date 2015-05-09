class Idea < ActiveRecord::Base
	has_and_belongs_to_many :tags
	belongs_to :participant

  def tag_names
    # Tag.all.map { |o| o.name }.join(",")
    self.tags.map { |o| o.name }.join(",")
  end

  def update_tags(tags_params)
    tag_list = tags_params[:tag_names].split(',').map(&:strip)
    tags = Tag.where(name: tag_list)
    if tags.size == tag_list.size
      self.tags = tags
      self.save
    end
  end
    
end
