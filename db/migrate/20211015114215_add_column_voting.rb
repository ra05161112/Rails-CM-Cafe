class AddColumnVoting < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :voting, :boolean, default: false
  end
end
