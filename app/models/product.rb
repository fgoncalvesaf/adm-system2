class Product < ApplicationRecord
	enum status: [:enabled, :disabled]
end
