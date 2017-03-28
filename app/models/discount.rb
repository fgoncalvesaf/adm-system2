class Discount < ApplicationRecord
	has_many :sales
	enum kind: [:percentage, :money]
end
