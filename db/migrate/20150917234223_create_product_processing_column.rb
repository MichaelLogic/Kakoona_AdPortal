class CreateProductProcessingColumn < ActiveRecord::Migration
  def change

    add_column :products, :grffk_processing, :boolean
    
  end
end
