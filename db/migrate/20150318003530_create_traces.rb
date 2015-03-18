class CreateTraces < ActiveRecord::Migration
  def change
    create_table :traces do |t|
      t.integer :item_id
      t.integer :input
      t.text :notes

      t.timestamps null: false
    end
  end
end
