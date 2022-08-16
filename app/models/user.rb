class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 },
            format: { with: /\A[a-zA-Z0-9_]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
