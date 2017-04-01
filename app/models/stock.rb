class Stock < ApplicationRecord
  belongs_to :product
  validates :product, uniqueness: true

  # atualizar total
  before_save do
  	@product = Product.find(self.product)
  	self.total = self.quantity * @product.price
  end

  # atualizar status do produto 
  after_save do
  	@product = Product.find(self.product)
  	if self.quantity == 0
  		@product.update_attribute(:status, :disabled)
  	else
  		@product.update_attribute(:status, :enabled)
	end
  end
end
