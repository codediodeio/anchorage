class CreateAnchors < ActiveRecord::Migration
  def change
    create_table :anchors do |t|
      t.belongs_to :user, index: true
      t.references :anchorable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
