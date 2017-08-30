class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
	   	if @user.save
	        render  json: @user
	    else
			render json: @user.errors, status: :unprocessable_entity
	    end
	end

	def login
		@user = User.where(email: params[:email], password: params[:password])
		if @user.exists?
			@user.update(token: SecureRandom.hex(16))
			@token = @user.pluck(:token)
			render json: {status: "true", token: @token}
		else
			render json: "false"
		end
	end

	def update
		@user = User.where(token: params[:token])
		if @user.exists?
			@user.update(user_params)
	   		render json: @user.first
	   	else
	   		render json: "User not exists!"
	   	end
	end

	def authenticate
		@user = User.where(token: params[:token])
		if @user.exists?
			render json: @user.first
		else
			render json: "false"
		end
	end

	def logout
		@user = User.where(token: params[:token])
		@user.update(token: "")
	end

	private

	def user_params
		params.permit(:name,:phone,:email,:password,:twitter,:facebook,:google,:picture,:banks,:account_numbers)
	end
end
