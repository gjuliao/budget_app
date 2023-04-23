class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groups

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
