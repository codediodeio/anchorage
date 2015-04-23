class AddDonationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donation, :string
  end
end
