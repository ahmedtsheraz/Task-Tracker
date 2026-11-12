class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :status, inclusion: { in: %w[pending in_progress completed] }
end