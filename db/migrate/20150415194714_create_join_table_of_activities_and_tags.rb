class CreateJoinTableOfActivitiesAndTags < ActiveRecord::Migration
  def change
  	create_join_table :activities, :tags do |t|
  	  # t.index :activity_id
  	  # t.index :tag_id
  	end
  end
end
