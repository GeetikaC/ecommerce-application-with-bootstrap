class Product < ApplicationRecord
has_many :reviews
belongs_to :category

has_many :cart_line_items

has_many :wishlists

has_many :order_line_items


validates_presence_of :name, :price, :description, :category_id, :feature_image_url
validates_numericality_of :price, minimum: 100
validates_numericality_of :category_id, greater_than_or_equal_to: 1

end
