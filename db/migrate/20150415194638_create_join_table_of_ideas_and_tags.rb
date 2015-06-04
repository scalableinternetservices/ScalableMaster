class CreateJoinTableOfIdeasAndTags < ActiveRecord::Migration
  def change
  	create_join_table :ideas, :tags do |t|
  		# t.index :idea_id
  		# t.index :tag_id
  	end
  end
end
