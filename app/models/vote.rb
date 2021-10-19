class Vote < ApplicationRecord

  belongs_to :users, optional: true
  belongs_to :item
end
