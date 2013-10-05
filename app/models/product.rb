class Product < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, presence: true
	has_many :orders
	 
end
