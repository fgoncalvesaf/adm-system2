class Item < ApplicationRecord
  belongs_to :product
  belongs_to :sale, optional: true
  validate :has_products?

  before_save do
  	self.total = self.product.price * self.quantity
  	@stock2 = Stock.where(product: self.product)
  	@quantity2 = @stock2.first.quantity
  	@stock2.first.update_attribute(:quantity, @quantity2 - self.quantity)
  end

  def has_products?
  	@stock = Stock.where(product: self.product)
  	@quantity = @stock.first.quantity
  	errors.add(:base, " -- Nao ha estoque disponivel.") if @quantity < self.quantity 
  end

  before_destroy do
  	@stock2 = Stock.where(product: self.product)
  	@quantity2 = @stock2.first.quantity
  	@stock2.first.update_attribute(:quantity, @quantity2 + self.quantity)
  end
end
