class AddTotalOrderIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :total_order, foreign_key: true
  end
end
