Rails.application.routes.draw do

  resources :transactions
  #User Authentication/Autorization
  post '/user/register' => "users#create"
  post '/user/login' => "users#login"
  post '/user/update' => "users#update"
  post '/user/authenticate' => "users#authenticate"
  post '/user/logout' => "users#logout"

  #Listing
  post '/listing/new' => "listings#new"
  post '/services/list' => "listings#my_listing"
  post '/services/delete' => "listings#delete"
  post '/listing/all' => "listings#all"
  get '/listing/view/:id' => "listings#view"
  post '/listing/hire' => "listings#send_text_message"
  post '/listing/update' => "listings#update"


  #Transaction
  post '/transaction/payment' => "transactions#payment"

end
