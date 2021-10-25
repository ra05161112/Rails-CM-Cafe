class Order < ApplicationRecord
  belongs_to :total_order
  has_many :items, dependent: :destroy
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: "1個以上のアイテムを選択してください" }

  
end
