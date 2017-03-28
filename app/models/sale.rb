class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :discount
  has_many :items
  has_many :installments
  enum status: [:pending, :paid]
end
