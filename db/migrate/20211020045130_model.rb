class Model < ActiveRecord::Migration[6.1]
  def change
    create_table :total_orders do |t|

      t.integer :total_price
      t.time :last_create_time

      t.timestamps
      
    end
  end
end
