class AddRecommendToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recom_count, :integer
  end
end
