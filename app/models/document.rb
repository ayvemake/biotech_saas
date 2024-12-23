class Document < ApplicationRecord
  belongs_to :patient
  has_one_attached :file

  validates :title, presence: true
  validates :category, presence: true
  validates :file, presence: true
  validate :correct_file_type

  private

  def correct_file_type
    if file.attached? && !file.content_type.in?(%w(application/pdf))
      errors.add(:file, 'must be a PDF')
    end
  end
end
