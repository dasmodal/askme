class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :hashtag_questions, dependent: :delete_all
  has_many :hashtags, through: :hashtag_questions
  
  validates :body, presence: true, length: { maximum: 280 }
end
