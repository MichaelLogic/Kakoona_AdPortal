class ModProducts < ActiveRecord::Migration
  def change
  	add_column :products, :download_url, :string

  	remove_column :products, :price, :float
  	remove_column :products, :in_stock, :integer
  	remove_column :products, :description, :string
  	remove_column :products, :config_vars, :hstore
  end
end
