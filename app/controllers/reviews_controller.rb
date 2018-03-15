class ReviewsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource 		#invokes ability class

	def index
		@reviews = current_user.reviews
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		respond_to do |format|
			if @review.save
				format.js
				format.json { render json: 'index' }

			else
				format.js
				format.json { render json: {errors: @reviews.errors.full_messages}}
			end
		end
		# if @review.save
		# 	redirect_to product_path(@review.product_id), notice: "Thanks for your feedback"
		# end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		# redirect_to product_path(@review.product_id), notice: "Successfully deleted"
	end

	private
	def review_params
		params[:review].permit(:body, :rating, :product_id)
	end
end
