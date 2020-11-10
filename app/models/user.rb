class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  
  has_secure_password
    
  has_many :messages
  has_many :lectures
  
#bookmark_relationship
  #has_many :favorite, thought: :messages, source: :lecture
  

#bookmark_function
  def like(lecture)
    Messages.find_or_create_by(lecture_id:lecture.id)
  end

#bookmark_remove_function
  def unlike(lecture)
    message = messages.find_by(lecture_id :lecture.id)
    message.destroy if message
  end

end