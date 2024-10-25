require "sinatra"
require "sinatra/reloader"

get("/hello") do
 erb(:hello)
end

get("/goodbye") do
  erb(:bye)
 end

 get("/square/new") do
  erb(:new_square_calc)
 end

 get ("/square_root/new") do
  erb (:new)
end

 get ("/square_root/result") do
  number = params[:number].to_f
  @result = Math.sqrt(number).round(3)
  erb (:result)
end

 get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
 end


 get '/square_root/new' do
  erb :square_root_new
end

get '/payment/new' do
  erb :payment_new
end

get '/square_root/result' do
  @number = params[:number].to_f
  @result = Math.sqrt(@number)
  erb :square_root_result
end

get '/payment/result' do
  apr = params[:apr].to_f / 100 / 12
  years = params[:years].to_i
  principal = params[:principal].to_f
  months = years * 12

  @monthly_payment = (principal * apr) / (1 - (1 + apr)**-months)
  @formatted_payment = sprintf('%.2f', @monthly_payment)
  erb :payment_result
end
