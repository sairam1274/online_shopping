class Renamecolumn < ActiveRecord::Migration
  def change
  	rename_column(:orders,:cust_id,:customer_id)
  end
end
