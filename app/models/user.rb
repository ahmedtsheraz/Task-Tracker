class User < ApplicationRecord
  has_many :tasks
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.titleize
  end
end