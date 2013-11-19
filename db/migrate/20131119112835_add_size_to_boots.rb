class AddSizeToBoots < ActiveRecord::Migration
  def change
    add_column :boots, :size, :integer
  end
end
