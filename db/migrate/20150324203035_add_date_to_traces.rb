class AddDateToTraces < ActiveRecord::Migration
  def change
  	add_column :traces, :u_date, :date
  end
end
