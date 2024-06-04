class Event < ApplicationRecord
  belongs_to :user
  validates :category, presence: true, uniqueness: false
  validates :content, presence: true, uniqueness: false
  # Soft delete
  scope :active, -> { where(deleted_at: nil) }
end
