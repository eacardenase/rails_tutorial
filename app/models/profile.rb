class Profile < ApplicationRecord
  validates :name, precense: true
  validates :city, precense: true
  validates :country, precense: true
  validates :birth, precense: true
  validates :gender, precense: true

  belongs_to :user
end
