class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	# load_and_authorize_resource 		#invokes ability class
	#path: products_path
	#url: localhost:3000/products
	#uri: /products
	#http method: GET
	#lists all products
	def index
		@products = Product.all
		@product = Product.new
	end

	#path: new_product_path
	#url: localhost:3000/products/new
	#uri: /products/new
	#http method: GET
	#creates new product
	def new
		@product = Product.new
	end

	#path: products_path
	#url: localhost:3000/products
	#uri: /products
	#http method: POST
	#takes the data in the form, passes it to the constructor as an argument, validate the object, if validations pass insert record into db and redirect the user to new page or display errors on the form page itself.
	def create
		@product = Product.new(params[:product].permit(:name, :description, :price, :category_id, :cod_eligible, :feature_image_url))
		respond_to do |format|
			if @product.save
				format.js
				# redirect_to product_path(@product.id), notice: "Product was successfully created!"
			else
				format.js
				# render action: 'new'
			end
		end
	end

	#path: product_path(id)
	#url: localhost:3000/products/:id
	#uri: /products/:id
	#http method: GET
	#fetches the product form the database and displays it on the show page, this page will be used to show all the the data about the product including associated info like reviews, QnA's, add product to the cart etc.
	def show
		@product = Product.find(params[:id])
		@review = Review.new
		@cart_line_item = CartLineItem.new
	end
	
	#path: edit_product_path(id)
	#url: localhost:3000/products/:id/edit
	#uri: /products/:id/edit
	#http method: GET
	#finds the record the user wishes to edit and display it on a form
	def edit
		@product = Product.find(params[:id])
	end

	#path: product_path(id)
	#url: localhost:3000/products/:id
	#uri: /products/:id
	#http method: PATCH
	#finds the record the user just updated in the browser and update its info by taking the data coming in from the form, validate the object.
	#if the validations pass, insert the record into the db and redirect the user to the product's new page,
	#else display the errors on the form
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product].permit(:name, :description, :price, :category_id, :cod_eligible, :feature_image_url))
			# redirect_to product_path(@product.id), notice: "Product was successfully updated!!"
		else
			# render action: 'edit'
		end
	end


	#path: product_path(id)
	#url: localhost:3000/products/:id
	#uri: /products/:id
	#http method: DELETE
	#find the record the user wants to delete, and destroy the record and redirect the user to new page
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: "Product was successfully deleted!"		
	end

end
