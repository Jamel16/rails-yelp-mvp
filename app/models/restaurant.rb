class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORIES = ["Chinese", "Italian", "Japanese", "French", "Belgian"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, presence: true
end
