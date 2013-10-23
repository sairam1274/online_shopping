class CartsProducts < ActiveRecord::Migration
  def change
  	  create_table :carts_products do |t|
      t.integer :cart_id
      t.integer :product_id
  end
  end
end
