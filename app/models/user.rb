class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.titleize
  end
end