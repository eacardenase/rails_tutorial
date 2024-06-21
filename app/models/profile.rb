class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birth, presence: true
  validates :gender, presence: true

  validate :validate_gender # singular for custom validation

  belongs_to :user

  enum role: [:member, :admin, :superadmin]

  private

  def validate_gender
    errors.add(:gender, "was specified incorrectly") unless ["Male", "Female"].include?(self.gender)
  end
end
