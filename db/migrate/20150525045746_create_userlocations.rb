class CreateUserlocations < ActiveRecord::Migration
  def change
    create_table :userlocations do |t|
      t.integer :user_id
      t.string :location
      t.time :updated_time

      t.timestamps null: false
    end
  end
end
