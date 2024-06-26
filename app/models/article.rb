class Article < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :avatar, presence: true
  validates :body, presence: true

  has_one_attached :avatar
  has_rich_text :body

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy

  def add_categories(ids)
    ids.each do |id|
      category = Category.find(id)

      self.categories << category
    end
  end

  def update_categories(ids)
    self.categories.delete_all unless self.categories.empty?

    ids.each do |id|
      category = Category.find(id)

      self.categories << category
    end
  end
end
