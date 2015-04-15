class Tag < ActiveRecord::Base
	has_and_belongs_to_many :participants
	has_and_belongs_to_many :activities
	has_and_belongs_to_many :organizers
	has_and_belongs_to_many :ideas
end
