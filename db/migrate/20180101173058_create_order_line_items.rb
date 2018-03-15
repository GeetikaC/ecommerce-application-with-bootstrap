class CreateOrderLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_line_items do |t|
      t.integer :product_id
      t.integer :price
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
