class Article < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :avatar, presence: true
  validates :body, presence: true

  has_one_attached :avatar
  has_rich_text :body

  belongs_to :user
  has_and_belongs_to_many :categories

  def add_categories(ids)
    ids.each do |id|
      category = Category.find(id)

      self.categories << category
    end
  end
end
