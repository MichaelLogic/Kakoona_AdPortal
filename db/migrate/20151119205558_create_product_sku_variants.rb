class CreateProductSkuVariants < ActiveRecord::Migration
  def change
    create_table :product_sku_variants do |t|
    	t.belongs_to :product, index: true
    	t.string	 :sku, null: false
    	t.text		 :feature_set, array:true, default: []
    	t.text		 :description
    	t.float		 :price
    	t.integer	 :in_stock

    	t.attachment :gal_grffk01
      	t.string   :cloud_asset01_url
      	t.attachment :gal_grffk02
      	t.string   :cloud_asset02_url
      	t.attachment :gal_grffk03
      	t.string   :cloud_asset03_url
      	t.attachment :gal_grffk04
      	t.string   :cloud_asset04_url
      	t.attachment :gal_grffk05
      	t.string   :cloud_asset05_url
      	t.attachment :gal_grffk06
      	t.string   :cloud_asset06_url

      	t.timestamps null: false
    end
  end
end
