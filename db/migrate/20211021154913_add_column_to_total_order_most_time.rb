class AddColumnToTotalOrderMostTime < ActiveRecord::Migration[6.1]
  def change
    add_column :total_orders, :large_time, :float
  end
end
