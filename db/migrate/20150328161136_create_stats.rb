class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :location, index: true
      t.decimal :lat
      t.string :latd
      t.decimal :long
      t.string :longd
      t.text :description
      t.boolean :fuel
      t.integer :slips
      t.integer :moorings
      t.string :protection
      t.string :type
      t.string :cost
      t.integer :pstart
      t.integer :pend

      t.timestamps null: false
    end
    add_foreign_key :stats, :locations
  end
end
