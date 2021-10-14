class Item < ApplicationRecord

  validates :name, presence: true, length: { maxmum: 20 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :creation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { maxmum: 200 }
end
