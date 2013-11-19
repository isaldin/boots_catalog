class AddNameToBoots < ActiveRecord::Migration
  def change
    add_column :boots, :name, :string
  end
end
