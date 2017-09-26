class ListingsController < ApplicationController

	def all
		if(params[:category] == "All Categories")
			@listing = Listing.all
			render json: @listing
		elsif(params[:category] == params[:category])
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
	    Google::UrlShortener::Base.api_key = "AIzaSyDn15jbVFDssr868I2bw3_sAGbEkVyTVhU"
	    url = Google::UrlShortener::Url.new(:long_url => "https://api.whatsapp.com/send?phone=+6#{params[:customer_number]}")
		whatsapp_link = url.shorten!

	    twilio_sid = ""
	    twilio_token = ""
	    twilio_phone_number = "4806463928"

	    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

	    @twilio_client.account.sms.messages.create(
	      :from => "+1#{twilio_phone_number}",
	      :to => number_to_send_to,
	      :body => 
	      "Someone has hired you for job #{job_names}\nContact Whatsapp: #{whatsapp_link}"
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

	def add_orders
		@order = Order.new(order_params)
		if @order.save
			render json: @order
		else
		end
	end

	def get_orders
		@orders = Order.where(customer_id: params[:id]).all
		render json: @orders
	end

	def get_task
		@task = Order.where(hobbez_id: params[:id]).all
		render json: @task
	end

	def task_status
		if(params[:type] == 'false')
				@task = TaskNotCompleted.new(task_not_completed_params)
				if @task.save
					@order = Order.where(id: params[:listing_id])
					@order_update = @order.update(status_by_hobbez: params[:status])
				else
				end
		elsif (params[:provider] == 'provider')
				@find = Order.where(id: params[:listing_id])
				if (@find)
					@update = @find.update_all(status_by_hobbez: 'true')
				else
				end
		elsif(params[:type] == 'true')
			@find = TaskCompleted.where(listing_id: params[:listing_id]).first
			if (@find)
				if(params[:upvote] == 'upvote')
					@upvote = @find.pluck(:upvote)
					@update = TaskCompleted.where(listing_id: params[:listing_id]).update_all(upvote: (@upvote + 1))
				elsif(params[:downvote])
					@task = TaskCompleted.increment_counter(:downvote , 1)
				end
			else
				@task = TaskCompleted.new(task_complete_params)
				if @task.save
					if(params[:upvote])
						@task.update(upvote: +1)
					elsif(params[:downvote])
						@task.update(downvote: +1)
					end
					@order = Order.where(id: params[:listing_id])
					@order_update = @order.update(status_by_hobbez: params[:status])
				else
					
				end
			end
		end
	end

	private
	def order_params
		params.permit(:duration_type,:description,:title,:images,:details,:duration,:category,:status_by_customer,:status_by_hobbez,:customer_id,:hobbez_id,:references)
	end

	def task_not_completed_params
		params.permit(:listing_id,:description)
	end

	def task_complete_params
		params.permit(:listing_id,:upvote,:downvote)
	end

	def listing_params
		params.permit(
			:title,:category,:price,:state,:address,:city,:zipcode,:images,:images2,:images3,:images4,
			:description,:phone,:website,:email,:user_id,:id,:rate)
	end
end
