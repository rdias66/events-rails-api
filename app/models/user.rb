class User < ApplicationRecord
  has_secure_password

  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # Soft delete scope
  scope :active, -> { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end
end
