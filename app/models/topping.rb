
class Topping < ApplicationRecord
  enum kind: {food: 0, drink: 1}

  validates :name, presence: true
  validates :price, presence: true
end