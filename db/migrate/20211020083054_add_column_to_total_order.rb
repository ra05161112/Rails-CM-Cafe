class AddColumnToTotalOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :total_orders, :user, foreign_key: true
  end
end
