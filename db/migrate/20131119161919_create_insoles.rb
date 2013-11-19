class CreateInsoles < ActiveRecord::Migration
  def change
    create_table :insoles do |t|
      t.string :name

      t.timestamps
    end
  end
end
