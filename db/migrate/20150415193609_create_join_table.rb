class CreateJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :activities, :participants do |t|
  		# t.index :activity_id
  		# t.index :participant_id
  	end
  end
end
