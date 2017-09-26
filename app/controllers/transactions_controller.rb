class TransactionsController < ApplicationController

	def payment
		collection_id = 'exkinhgy'
	    url_bill = 'https://billplz-staging.herokuapp.com/api/v2/bills'
	    api_key = 'd6b40b9f-4c77-47f5-a239-12f75eef34f0:' 

	     @bill = HTTParty.post(url_bill.to_str,
            :body  => { 
            	:collection_id => collection_id, 
            	:email=> params[:email], 
            	:name=> params[:name], 
            	:amount=>  params[:amount]*100, 
            	:callback_url=>  "http://localhost:3000/listing/#{params[:id]}"}.to_json,
            :basic_auth => { :username => api_key },
            :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
        
    	@bill_url =  @bill.parsed_response["url"]
    	@bill_id =  @bill.parsed_response["id"]
    	render json: {url: @bill_url, id: @bill_id}
	end

	def get_bill
    url_bill = "https://billplz-staging.herokuapp.com/api/v2/bills/#{params[:id]}"
    api_key = 'd6b40b9f-4c77-47f5-a239-12f75eef34f0:' #You can get the secret key in your billplz's setting account
    
		@get_bill = HTTParty.get(url_bill,
			         :basic_auth => { :username => api_key },
			         :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
		@paid = @get_bill.parsed_response["paid"]
		render json: @paid
  end

	private

	def billplz_params
		params.permit(:email,:name,:amount)
	end
end
