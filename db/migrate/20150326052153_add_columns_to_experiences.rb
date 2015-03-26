class AddColumnsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :anchors_count, :integer, default: 0
    add_column :images, :anchors_count, :integer, default: 0
  end
end
