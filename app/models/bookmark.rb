class Bookmark < ApplicationRecord
    validates :user_id, presence: true
    validates :lecture_id, presence: true
end
