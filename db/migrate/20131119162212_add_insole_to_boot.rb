class AddInsoleToBoot < ActiveRecord::Migration
  def change
    add_column :boots, :insole_id, :integer
  end
end
