class AddAvatarToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :avatar, :string
  end
end
