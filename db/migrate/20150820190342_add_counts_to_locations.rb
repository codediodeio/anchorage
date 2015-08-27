class AddCountsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :anchor_count, :integer, null: false, default: 0
    add_column :locations, :experience_count, :integer, null: false, default: 0
    add_column :locations, :image_count, :integer, null: false, default: 0
  end
end
