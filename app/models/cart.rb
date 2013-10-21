class Cart < ActiveRecord::Base
	has_many :cart_products
	belongs_to :customer
end
