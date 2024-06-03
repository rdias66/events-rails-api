class Event < ApplicationRecord
  belongs_to :user

  # Soft delete
  scope :active, -> { where(deleted_at: nil) }
end
