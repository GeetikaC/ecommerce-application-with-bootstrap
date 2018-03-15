class Order < ApplicationRecord
	belongs_to :user
	belongs_to :address
	has_many :order_line_items
	
	before_validation :set_default_values
	after_create :transfer_cartlineitems_to_orderlineitems
	after_create :empty_cartlineitems


	validates_presence_of :order_number, :order_date, :user_id, :total, :address_id

	def set_default_values
		self.order_number = "#{Random.rand(1000)}"
		self.order_date = Date.today
		self.total = calculate_total
	end

	def calculate_total
		total = 0
		self.user.cart_line_items.each do |cart_line_item|
			total += (cart_line_item.product.price * cart_line_item.quantity)
		end
		return total
	end

	def transfer_cartlineitems_to_orderlineitems
		self.user.cart_line_items.each do |cart_line_item|
			OrderLineItem.create(product_id: cart_line_item.product_id, price: cart_line_item.product.price, order_id: self.id, quantity: cart_line_item.quantity)
		end
	end

	def empty_cartlineitems
		# self.user.cart_line_items.each do |cart_line_item|
		# 	cart_line_item.destroy
		# end
		CartLineItem.delete(self.user.cart_line_items)

	end
end