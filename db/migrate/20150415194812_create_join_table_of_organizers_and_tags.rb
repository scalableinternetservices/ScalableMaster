class CreateJoinTableOfOrganizersAndTags < ActiveRecord::Migration
  def change
  	create_join_table :organizers, :tags do |t|
  	  # t.index :organizer_id
  	  # t.index :tag_id
  	end
  end
end
