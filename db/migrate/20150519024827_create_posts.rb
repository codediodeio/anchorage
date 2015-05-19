class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :featured_image
      t.string :description
      t.string :permalink

      t.timestamps null: false
    end
  end
end
