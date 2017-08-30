class TransactionsController < ApplicationController

	def payment
		@bill = Billplz::Bill.new(
			{ 
				collection_id: 'exkinhgy',
				name:'Aizuddin',
				amount: 12000,
				callback_url: 'staging-hobbez.herokuapp.com'
			})
		@bill.create
		render json: @bill
	end
end
