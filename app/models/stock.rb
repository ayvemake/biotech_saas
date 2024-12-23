class Stock < ApplicationRecord
  # Définir explicitement les attributs accessibles
  attr_accessor :name, :quantity, :minimum_quantity, :category, :expiry_date

  # Validations
  validates :name, presence: true
  validates :category, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :minimum_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :expiry_date, presence: true

  # Callbacks pour le debug
  after_initialize :log_initialize
  before_save :log_before_save
  after_save :log_after_save

  def low_stock?
    quantity <= minimum_quantity
  end

  def expiring_soon?
    expiry_date <= 30.days.from_now
  end

  def status
    if quantity.zero?
      'Out of stock'
    elsif low_stock?
      'Low stock'
    else
      'In stock'
    end
  end

  private

  def log_initialize
    Rails.logger.debug "Stock initialized with attributes: #{attributes.inspect}"
  end

  def log_before_save
    Rails.logger.debug "Stock before save: #{changes.inspect}"
  end

  def log_after_save
    Rails.logger.debug "Stock saved with attributes: #{attributes.inspect}"
  end
end 