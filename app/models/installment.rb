class Installment < ApplicationRecord
  belongs_to :sale
  validates :value, presence: true, numericality: true
  validates :payment_date, presence: true

  after_save do
  	@sale = Sale.find(self.sale)
  	@sale.update_attribute(:remaining, @sale.remaining - self.value)
  end

  before_destroy do
  	@sale = Sale.find(self.sale)
  	@sale.update_attribute(:remaining, @sale.remaining + self.value)
  end
end
