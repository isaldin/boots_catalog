class AddSoleToBoot < ActiveRecord::Migration
  def change
    add_column :boots, :sole_id, :integer
  end
end
