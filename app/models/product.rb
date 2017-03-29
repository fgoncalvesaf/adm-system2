class Product < ApplicationRecord
	enum status: [:enabled, :disabled]

	# create disabled product
	before_create do
		self.status = :disabled
	end
end
