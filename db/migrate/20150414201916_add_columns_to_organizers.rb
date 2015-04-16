class AddColumnsToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :name, :string
    add_column :organizers, :nickname, :string
    add_column :organizers, :gender, :integer
    add_column :organizers, :age, :integer
    add_column :organizers, :phone, :string
    add_column :organizers, :address, :string
    add_column :organizers, :img_url, :string
    add_column :organizers, :intro, :text
  end
end
