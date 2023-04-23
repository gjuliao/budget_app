class Group < ApplicationRecord
  belongs_to :user
  has_many :entities

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true, length: { minimum: 3, maximum: 150 }
end
