class ProductSerializer < ActiveModel::Serializer

  attributes :product_type, :name, :description, :price, :in_stock, :cloud_asset_url, :config_vars

end
