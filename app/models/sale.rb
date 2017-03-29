class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :discount, optional: true
  has_many :items
  has_many :installments
  enum status: [:pending, :paid]

  before_create do
  	if new_record?
  	  self.status = :pending
  	end
  end
end
