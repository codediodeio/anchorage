class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :location, index: true
      t.float :lat
      t.string :latd
      t.float :long
      t.string :longd
      t.text :description
      t.boolean :fuel
      t.integer :slips, default: 0
      t.integer :moorings, default: 0
      t.integer :protection, default: 0
      t.string :ltype, default: "Destination"
      t.string :cost
      t.integer :pstart
      t.integer :pend

      t.timestamps null: false
    end
    add_foreign_key :stats, :locations
  end
end
