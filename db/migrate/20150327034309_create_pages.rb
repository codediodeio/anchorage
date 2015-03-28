class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :guide, index: true
      t.belongs_to :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :pages, :guides
    add_foreign_key :pages, :locations
  end
end
