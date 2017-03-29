class Client < ApplicationRecord
	has_many :addresses
	has_many :sales
	accepts_nested_attributes_for :addresses
end
