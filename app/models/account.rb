class Account < ApplicationRecord
 validates :introduction, presence: true, length: { maximum: 200 }
 validates :image, presence: true
 mount_uploader :image, ImageUploader
 belongs_to :user
end
