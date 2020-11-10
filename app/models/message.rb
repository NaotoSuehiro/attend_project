class Message < ApplicationRecord
  belongs_to :user
  belongs_to :lecture
  
  validates :content, presence: true, length: { maximum: 255 }
  
end