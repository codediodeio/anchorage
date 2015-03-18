class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :user, index: true
      t.belongs_to :location, index: true
      t.text :body

      t.timestamps null: false
    end
    add_foreign_key :experiences, :users
    add_foreign_key :experiences, :locations
  end
end
