class ChangeProductTypeColumnInProduct < ActiveRecord::Migration
  def change
  	change_column :products, :product_type, 'integer USING CAST(product_type AS integer)', index: true
  end
end
