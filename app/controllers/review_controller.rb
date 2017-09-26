class ReviewController < ApplicationController

	def get_review
		@review = Review.where(listing_id: params[:id])
		render json: @review
	end

	def add_review
		@review = Review.new(review_params)
		if @review.save
			render json: @review
		else
		end
	end

	private

	def review_params
		params.permit(:name, :email, :review, :listing_id)
	end

end
