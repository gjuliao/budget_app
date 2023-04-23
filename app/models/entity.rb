class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groups
end
