class AddStarsToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :stars, :integer, default: 0
  end
end
