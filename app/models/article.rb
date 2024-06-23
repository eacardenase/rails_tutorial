class Article < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  has_one_attached :avatar
  has_rich_text :body

  belongs_to :user
end
