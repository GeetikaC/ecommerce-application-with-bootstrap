class AddColumnUrlToBrands < ActiveRecord::Migration[5.1]
  def change
  	add_column :brands, :brand_url, :string
  end
end
