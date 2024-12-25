class Patient < ApplicationRecord
  has_many :blood_samples
  has_many :analyses

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    return nil unless date_of_birth
    now = Time.current.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end
end 