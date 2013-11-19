class CreateSoles < ActiveRecord::Migration
  def change
    create_table :soles do |t|
      t.string :name

      t.timestamps
    end
  end
end
