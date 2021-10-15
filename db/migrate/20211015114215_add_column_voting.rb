class AddColumnVoting < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :voting, :boolean, default: false
  end
end
