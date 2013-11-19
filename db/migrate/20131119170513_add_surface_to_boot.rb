class AddSurfaceToBoot < ActiveRecord::Migration
  def change
    add_column :boots, :surface_id, :integer
  end
end
