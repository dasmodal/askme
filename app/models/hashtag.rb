class Hashtag < ApplicationRecord
  has_many :hashtag_questions, dependent: :delete_all
  has_many :questions, through: :hashtag_questions

  scope :with_questions, -> { where_exists(:hashtag_questions) }
end
