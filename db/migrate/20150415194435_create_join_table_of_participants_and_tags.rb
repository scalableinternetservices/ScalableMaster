class CreateJoinTableOfParticipantsAndTags < ActiveRecord::Migration
  def change
  	create_join_table :participants, :tags do |t|
  		# t.index :participant_id
  		# t.index :tag_id
  	end
  end
end
