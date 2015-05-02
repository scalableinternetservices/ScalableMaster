class Activity < ActiveRecord::Base
	has_and_belongs_to_many :participants
	has_and_belongs_to_many :tags
	belongs_to :organizer
	#attr_accessible :avatar, :avatar_cache, :remove_avatar
	mount_uploader :avatar, AvatarUploader
end
