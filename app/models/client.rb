class Client < ApplicationRecord
	has_many: addresses
	accepts_nested_attributes_for :address
end
