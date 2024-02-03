require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square_new)
end

post("/square/results") do
  @title = "Square Results"
  @input = params[:user_number].to_f
  @squared_number = @input**2
  @output = "<dl>
  <dt>
    Number
  </dt>
  <dd>
    #{@input}
  </dd>
  <dt>
    Square
  </dt>
  <dd>
    #{@squared_number}
  </dd>
  </dl>"
  @outro = '<a href="/square/new">Calculate another square</a>'

  erb(:results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

post("/square_root/results") do
  @title = "Square Root Results"
  @input = params[:user_number].to_f
  @squared_number = Math.sqrt(@input).to_f
  @output = "<dl>
  <dt>
    Number
  </dt>
  <dd>
    #{@input}
  </dd>
  <dt>
    Square
  </dt>
  <dd>
    #{@squared_number}
  </dd>
  </dl>"
  @outro = '<a href="/square_root/new">Calculate another square root</a>'

  erb(:results)
end

get("/payment/new") do
  erb(:payment_new)
end

post("/payment/results") do
  @title = "Payment Results"
  @apr = params[:apr].to_f / 100 / 12  # Convert APR to a monthly interest rate
  @number_of_years = params[:number_of_years].to_i * 12  # Convert years to months
  @principal = params[:principal].to_f

  numerator = @apr * (1 + @apr)**@number_of_years
  denominator = ((1 + @apr)**@number_of_years) - 1

  @monthly_payment = @principal * (numerator / denominator)

  @output = "<dl>
  <dt>
    APR
  </dt>
  <dd>
    #{(@apr * 12 * 100).to_f.to_s.to_f.to_fs(:percentage, precision: 4)}
  </dd>

  <dt>
    Number of years
  </dt>
  <dd>
    #{@number_of_years / 12}
  </dd>

  <dt>
    Principal
  </dt>
  <dd>
    #{@principal.to_f.to_s.to_f.to_fs(:currency)}
  </dd>

  <dt>
    Payment
  </dt>
  <dd>
    #{@monthly_payment.to_f.to_s.to_f.to_fs(:currency, precision: 2)}
  </dd>
</dl>"

  @outro ='<a href="/payment/new">Calculate another payment</a>'

  erb(:results)
end

get("/random/new") do
  erb(:random_new)
end

post("/random/results") do
  @title = "Random Results"
  @min_input = params[:user_min].to_f
  @max_input = params[:user_max].to_f
  @random_number = rand(@min_input..@max_input)
  @output = "<dl>
  <dt>Minimum</dt>
  <dd>#{@min_input}</dd>

  <dt>Maximum</dt>
  <dd>#{@max_input}</dd>

  <dt>Random Number</dt>
  <dd>#{@random_number}</dd>
</dl>"
  @outro = '<a href="/random/new">Pick another random number</a>'

    erb(:results)
end
