class ListingsController < ApplicationController

	def all
		if(params[:category] == "All Categories")
			@listing = Listing.all
			render json: @listing
		elsif(!(params[:category] == ""))
			@listing = Listing.where(category: params[:category]).all
			render json: @listing
		end
	end

	def update
		@listing = Listing.where(id: params[:id])
		@listing_update = @listing.update(listing_params)
	end

	def view
		@listing = Listing.find(params[:id])
		@user_id = Listing.where(id: params[:id])
		@get_user_id = @user_id.pluck(:user_id)
		@user = User.where(id: @get_user_id).first
		render json: {listing: @listing, user: @user}
	end

	def new
		@user = User.where(token: params[:token])
		if @user.exists?
			@user_id = @user.pluck(:id)
			@listing = Listing.new(listing_params)
			if @listing.save
				render json: @listing
			else
				render json: @listing.error
			end
		else
			render json: "Cannot find user id"
		end
	end

	def my_listing
		@listing = Listing.where(user_id: params[:id])
		render json: @listing
	end

	def send_text_message
	    number_to_send_to = params[:number_to_send_to]
	    job_names = params[:job_names]

	    twilio_sid = "ACe9f7c8e82c2bb9b2d946d9714651f3d3"
	    twilio_token = "1f52df9d6e239fc7fc0562fa238eec08"
	    twilio_phone_number = "4806463928"

	    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

	    @twilio_client.account.sms.messages.create(
	      :from => "+1#{twilio_phone_number}",
	      :to => number_to_send_to,
	      :body => "Someone has hired you for job #{job_names}"
	    )
	  end

	def delete
		@listing = Listing.where(user_id: params[:id])
		if @listing.exists?
			@listing_destroy = Listing.where(id: params[:listing_id]).first
			@listing_destroy.destroy
			render json: @listing_destroy
		else
			render json: "Error"
		end
	end

	private
	def listing_params
		params.permit(
			:title,:category,:price,:state,:address,:city,:zipcode,:images,:images2,:images3,:images4,
			:description,:phone,:website,:email,:user_id,:id,:rate)
	end
end
