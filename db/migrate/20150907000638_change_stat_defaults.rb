class ChangeStatDefaults < ActiveRecord::Migration
  def down
    change_column :stats, :lat, :float
    change_column :stats, :long, :float
    change_column :stats, :latd, :string
    change_column :stats, :longd, :string
    change_column :stats, :description, :text
    change_column :stats, :fuel, :boolean
    change_column :stats, :cost, :string
    change_column :stats, :pstart, :integer
    change_column :stats, :pend, :integer
  end

  def up
    change_column :stats, :lat, :float, default: 34.00, null: false
    change_column :stats, :long, :float, default: 119.00, null: false
    change_column :stats, :latd, :string, default: "", null: false
    change_column :stats, :longd, :string, default: "", null: false
    change_column :stats, :description, :text, default: "", null: false
    change_column :stats, :fuel, :boolean, default: false, null: false
    change_column :stats, :cost, :string, default: "", null: false
    change_column :stats, :pstart, :integer, default: 0, null: false
    change_column :stats, :pend, :integer, default: 1, null: false
  end
end
