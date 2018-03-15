class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	# load_and_authorize_resource 		#invokes ability class
	def index
		@categories = Category.all
		@category = Category.new
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		respond_to do |format|
			if @category.save
				format.js
				# redirect_to categories_path, notice: "Category successfully created!"
			else
				format.js
				# render action: 'new'
			end
		end
	end

	def show
		@product = Product.new
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category].permit(:name))
			redirect_to categories_path, notice: "Category successfully updated!!"
		else
			render action: 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path, notice: "Category successfully deleted!"
	end


end
