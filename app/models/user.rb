class User < ApplicationRecord
  has_secure_password

  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # Soft delete
  scope :active, -> { where(deleted_at: nil) }
end
