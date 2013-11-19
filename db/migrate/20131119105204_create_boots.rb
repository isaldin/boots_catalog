class CreateBoots < ActiveRecord::Migration
  def change
    create_table :boots do |t|
      t.integer :colour_id

      t.timestamps
    end
  end
end
