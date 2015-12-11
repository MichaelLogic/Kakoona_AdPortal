class CreateProductFeatureValues < ActiveRecord::Migration
  def change
    create_table :product_feature_values do |t|
    	t.belongs_to :product_feature, index: true
    	t.string	 :value, null: false
    	t.string     :abbreviation, null: true
    end
  end
end
