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
  post '/services/orders' => "listings#get_orders"
  post '/services/task' => "listings#get_task"
  post '/services/delete' => "listings#delete"
  post '/listing/all' => "listings#all"
  get '/listing/view/:id' => "listings#view"
  post '/listing/hire' => "listings#send_text_message"
  post '/listing/update' => "listings#update"
  post '/listing/order/create' => "listings#add_orders"


  #Transaction
  post '/transaction/payment' => "transactions#payment"
  post '/transaction/get_bill' => "transactions#get_bill"


  #Review
  post '/review/new' => "review#add_review"
  get '/review/listing/:id' => "review#get_review"

  #Task
  post '/task/status/:type' => "listings#task_status"

end
