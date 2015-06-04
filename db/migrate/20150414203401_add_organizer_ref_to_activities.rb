class AddOrganizerRefToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :organizer, index: false
    add_foreign_key :activities, :organizers
  end
end
