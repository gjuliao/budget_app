class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true, length: { minimum: 3, maximum: 150 }

  def sum_numbers(numbers)
    sum = 0
    numbers.each do |number|
      sum += number
    end
    sum
  end
end
