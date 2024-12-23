class Patient < ApplicationRecord
  has_many :diagnoses, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :analyses, dependent: :destroy
  has_many :follow_ups, dependent: :destroy
  has_many :blood_samples, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :phone, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    return nil unless date_of_birth
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end

  def latest_diagnosis
    diagnoses.order(date: :desc).first
  end

  def upcoming_appointment
    follow_ups.where('next_appointment >= ?', Date.today).order(next_appointment: :asc).first
  end

  def pending_analyses
    analyses.where(status: 'pending')
  end
end 