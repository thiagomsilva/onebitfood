class AddStreetToOrder < ActiveRecord::Migration[7.1]
  # todo: problema ao adicionar a coluna street
  def change
    add_column :orders, :street, :string
  end
end
