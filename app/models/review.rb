class Review < ApplicationRecord
  belongs_to :item
  has_many :user_reviews
  has_many :users, through: :user_reviews
end
