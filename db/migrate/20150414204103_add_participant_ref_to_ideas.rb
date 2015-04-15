class AddParticipantRefToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :participant, index: true
    add_foreign_key :ideas, :participants
  end
end
