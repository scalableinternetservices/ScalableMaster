class Activity < ActiveRecord::Base
	has_and_belongs_to_many :participants
	has_and_belongs_to_many :tags
	belongs_to :organizer
	#attr_accessible :avatar, :avatar_cache, :remove_avatar
	# mount_uploader :avatar, AvatarUploader
	has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100#", :large => "800x500#"}, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
