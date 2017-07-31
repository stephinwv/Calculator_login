require "sinatra"
require_relative "function.rb"
get "/" do
erb :index
end
post '/index' do
  password = params[:password]

  saved = ["steph", "doggy", "techy"]
    if password.include?(saved[0]) || password.include?(saved[1]) || password.include?(saved[2])
  
      redirect '/get_name?password=' + password
      else
        redirect '/wrong_pass?'
    end
  
end

get '/get_name' do
  password = params[:password]
  erb :get_name, :locals => {:password => password}
end
post '/get_name' do
  fname = params[:fname].capitalize
  lname = params[:lname].capitalize
  redirect '/do_math?fname=' + fname + '&lname=' + lname
end
get '/wrong_pass' do
  password = params[:password]
  erb :wrong_pass
end
# 
post '/wrong_pass' do
redirect '/log2?'
end
get '/log2'do 
  
  erb :log2
end
post '/log2' do
password = params[:password]

  saved = ["steph", "doggy", "techy"]
        if password.include?(saved[0]) || password.include?(saved[1]) || password.include?(saved[2])
  
        redirect '/get_name?password=' + password
        else
        redirect '/wrong_pass?'
    end
  
end
get '/do_math' do
  puts "made it to  get math do "

  fname = params[:fname]
  puts "fname = #{fname}"
  lname = params[:lname]
  puts = " lname = #{lname}"
  # math = params[:math]
  # num1 = params[:num1]
  # num2 = params[:num2]
  erb :do_math, :locals=> {:fname=> fname, :lname=> lname}
end
post '/do_math' do
  puts "made it to poost do_math do"
  fname =  params[:fname]
  puts "fname = #{fname}"
  lname = params[:lname]
  puts "lname = #{lname}"
  num1 = params[:num1]
  puts "num1 = #{num1}"
  num2 = params[:num2]
  puts "num2 = #{num2}"
  math = params[:math]
  puts "math = #{math}"
  total = params[:total]
  total = calc(math, num1.to_i, num2.to_i)
  puts "total = #{total}"
  redirect '/results?fname=' + fname + '&lname='+ lname + '&num1=' + num1 + '&num2=' + num2 + '&math=' + math + '&total=' + total
end
get '/results' do
  fname =  params[:fname]
  lname = params[:lname]
  math = params[:math]
  num1 = params[:num1]
  num2 = params[:num2]
  total = params[:total]
  total = calc(math, num1.to_i, num2.to_i)
  erb :results, :locals=> {:fname=> fname, :lname=> lname, :math=> math, :num1=> num1, :num2=> num2, :total=> total}
end
  
     
    