class Question < ApplicationRecord
  scope :by_recently_created, -> { order(created_at: :desc) }

  validates :body, presence: true, length: { maximum: 280 }
end
