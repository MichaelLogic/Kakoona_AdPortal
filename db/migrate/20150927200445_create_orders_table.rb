class CreateOrdersTable < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :ad_campaign, index: true
 	  t.string :selected_product_model
      t.integer :quantity
      t.float	:total_sale
      t.boolean :shipping_needed, default: true, null: false
      t.string :consumer_id
      t.string :address_line01
      t.string :address_line02
      t.string :city
      t.string :state_province
      t.string :postal_code
      t.string :country_region
      t.float :lat
      t.float :lng
      t.timestamps :null=> false
    end
  end
end
