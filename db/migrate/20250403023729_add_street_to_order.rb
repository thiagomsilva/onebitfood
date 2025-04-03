class AddStreetToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :street, :string
  end
end
