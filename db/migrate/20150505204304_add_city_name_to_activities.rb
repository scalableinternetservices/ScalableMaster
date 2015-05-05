class AddCityNameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :city_name, :string
  end
end
