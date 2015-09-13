class AddCoordsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :lat, :float
    add_column :experiences, :long, :float
    add_column :experiences, :anchor_time, :datetime
    add_reference :regions, :parent, index: true
  end
end
