class AddFiledsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :name, :string
    add_column :customers, :address, :text
    add_column :customers, :gender, :string
  end
end
