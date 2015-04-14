class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :img_url
      t.string :phone
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :start_time
      t.datetime :end_time
      t.integer :scale
      t.string :email

      t.timestamps null: false
    end
  end
end
