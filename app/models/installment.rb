class Installment < ApplicationRecord
  belongs_to :sale
  validates :value, presence: true, numericality: true
end
