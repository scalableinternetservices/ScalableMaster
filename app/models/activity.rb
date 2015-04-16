class Activity < ActiveRecord::Base
	has_and_belongs_to_many :participants
	has_and_belongs_to_many :tags
	belongs_to :organizer
end
