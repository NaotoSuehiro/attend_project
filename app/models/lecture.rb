class Lecture < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 200 }
  validates :room, presence: true
  
  mount_uploader :room, ImageUploader
  has_many :messages
  has_many :users, through: :messages
end
