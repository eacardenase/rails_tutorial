class Article < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  has_one_attached :avatar

  belongs_to :user
end
