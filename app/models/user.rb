class User < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :user_reviews
  has_many :reviews, through: :user_reviews
  has_secure_password

  validates :name, :username, :password, :role, presence: true
  validates :username, uniqueness: true

  enum role: ['user', 'admin']

  before_save :sanitize_username

  private

  def sanitize_username
    if username
      self.username = username.downcase
    end
  end
end
