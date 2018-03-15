class RenameColumnImageUrlInProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :image_url, :feature_image_url
  end
end
