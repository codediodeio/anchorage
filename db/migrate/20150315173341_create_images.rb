class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :users
    add_foreign_key :images, :locations
  end
end
