class DropItemIdColumn < ActiveRecord::Migration
  def change
  	remove_column :traces, :item_id
  end
end
