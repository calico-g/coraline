class AddTracesAssociationToItem < ActiveRecord::Migration
  def self.up
      add_column :traces, :item_id, :integer
      add_index 'traces', ['item_id'], :name => 'index_item_id' 
  end

  def self.down
      remove_column :traces, :item_id
  end
end
