class AddDonationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donation, :string
    add_column :locations, :featured, :boolean, default: false
  end
end
