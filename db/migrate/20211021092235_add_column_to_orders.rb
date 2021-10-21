class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :creation_time, :time
  end
end
