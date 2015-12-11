class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
    	t.belongs_to :product, index: true
    	t.string :ftr_name
    	t.string :ftr_detail
    end
  end
end
