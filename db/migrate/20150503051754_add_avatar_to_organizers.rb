class AddAvatarToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :avatar, :string
  end
end
