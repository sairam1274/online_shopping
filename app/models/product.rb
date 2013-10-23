class Product < ActiveRecord::Base
	has_attached_file :image , :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.jpeg"
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, presence: true
	has_many :orders
	has_and_belongs_to_many :carts
end
