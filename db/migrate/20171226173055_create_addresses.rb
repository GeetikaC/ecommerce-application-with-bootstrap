class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
    	t.string :name
    	t.string :pincode
		t.text :street
		t.string :landmark
		t.string :city
		t.integer :user_id
    	t.timestamps
    end
  end
end
