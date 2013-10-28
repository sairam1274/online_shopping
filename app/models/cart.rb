class Cart < ActiveRecord::Base
	belongs_to :customer
	has_and_belongs_to_many :products
	before_destroy { products.clear }
end
