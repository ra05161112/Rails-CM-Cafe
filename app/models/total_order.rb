class TotalOrder < ApplicationRecord
  has_many :orders, dependent: :destroy
  accepts_nested_attributes_for :orders

  validates :order.quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: "1個以上のアイテムを選択してください" }
  
end
