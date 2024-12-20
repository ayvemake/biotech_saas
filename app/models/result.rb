class Result < ApplicationRecord
  belongs_to :test

  validates :raw_data, :interpretation, presence: true
end
