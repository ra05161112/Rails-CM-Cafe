class AddColumnItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :voted_count, :integer, default: 0
  end
end
