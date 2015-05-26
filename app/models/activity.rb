class Activity < ActiveRecord::Base
	has_and_belongs_to_many :participants
	has_and_belongs_to_many :tags
	belongs_to :organizer
	#attr_accessible :avatar, :avatar_cache, :remove_avatar

    def tag_names
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
    @@id_path = ["001","002", "003", "004", "005", "006", "007", "008", "009", "010"]
    @@img_name = ["1.jpg","10.jpg", "2.jpg", "3.jpg", "4.jpg", "6.jpg", "7.jpg", "IMG_5411.jpg", "IMG_6056.jpg", "IMG_6169.jpg"]
    def self.get_rand
      @@index = Random.rand(10)
      @@index
    end
    

	has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100#", :large => "700x700#"}, :default_url => lambda {|x| "http://s3-us-west-2.amazonaws.com/scalableinternetservices/ScalableMaster/default/activities/avatars/000/000/#{@@id_path[Activity.get_rand]}/large/#{@@img_name[@@index]}"}
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
# endlambda {"http://s3-us-west-2.amazonaws.com/scalableinternetservices/ScalableMaster/activities/avatars/000/000/#{@@id_path[get_rand]}/original/#{@@img_name[@@index]}"}
end