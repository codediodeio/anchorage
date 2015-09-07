class AddUserToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :user, index: true
    add_foreign_key :locations, :users
  end
end
