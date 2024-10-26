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

 get("/square/results") do
  erb(:square_results)
 end

 get ("/square_root/new") do
  erb (:square_root_new)
end


get ("/square_root/result") do
  @number = params[:users_number].to_f
  @result = Math.sqrt(@number).round(3).to_f
  erb (:square_root_result)
end


get ("/payment/new") do
  erb (:payment_new)
end

post '/payment/result' do
  apr = params[:apr].to_f / 100 / 12
  years = params[:years].to_i
  principal = params[:principal].to_f
  months = years * 12

  @monthly_payment = (principal * apr) / (1 - (1 + apr)**-months)
  @formatted_payment = sprintf('%.2f', @monthly_payment)
  @formatted_apr = (params[:apr].to_f).round(4).to_s + '%' # Format APR as percentage

  erb :payment_result
end

get ("/random/new") do
  erb (:random_new)
end

get ("/random/result") do
  min = params[:minimum].to_f
  max = params[:maximum].to_f
  random_number = rand(min..max)
  erb (:random_result)
end
