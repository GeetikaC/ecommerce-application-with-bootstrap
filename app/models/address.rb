class Address < ApplicationRecord
	belongs_to :user
	has_many :orders
	validates_presence_of :name, :pincode, :street, :landmark, :city, :user_id
end
