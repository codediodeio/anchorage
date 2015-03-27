class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name
      t.string :permalink
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :guides, :users
  end
end
