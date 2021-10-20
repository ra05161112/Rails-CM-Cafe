class Order < ApplicationRecord
  belongs_to :total_order
  has_many :items, dependent: :destroy
  validates :quantity, numericality: { greater_than: 0 }
end
