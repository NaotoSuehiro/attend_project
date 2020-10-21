class Lecture < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :messages
  has_many :users,through: :messages
end
