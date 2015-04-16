class AddColumnsToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :name, :string
    add_column :participants, :nickname, :string
    add_column :participants, :gender, :integer
    add_column :participants, :age, :integer
    add_column :participants, :phone, :string
    add_column :participants, :address, :string
    add_column :participants, :img_url, :string
  end
end
