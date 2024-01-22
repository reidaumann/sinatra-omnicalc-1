require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_calc)
end

get("/random/results") do
  @min_number = params.fetch("users_min_number").to_f
  @max_number = params.fetch("users_max_number").to_f

  @random_number = rand(@min_number..@max_number)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @apr_number = params.fetch("users_apr_number").to_f
  @years_number = params.fetch("users_years_number").to_i
  @principal_number = params.fetch("users_principal_number").to_f

  rate_per_period = (@apr_number/100)/12
  number_of_periods = @years_number * 12

  numerator = rate_per_period * @principal_number
  denominator= 1 - ((1 + rate_per_period)**-number_of_periods)

  @monthly_payment = (numerator/denominator).to_fs(:currency)

  erb(:payment_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
