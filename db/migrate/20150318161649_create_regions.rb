class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :permalink

      t.timestamps null: false
    end

    create_table :locations_regions, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :region, index: true
    end
  end
end
