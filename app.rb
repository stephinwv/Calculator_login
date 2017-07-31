require "sinatra"
require_relative "function.rb"
#function.rb is where my math functions are
get "/" do
erb :index
#erb :index is my home or start page
end
post '/index' do
  password = params[:password]

  saved = ["steph", "doggy", "techy"]
#These are the three saved names for passwords
    if password.include?(saved[0]) || password.include?(saved[1]) || password.include?(saved[2])
#Went with a .include to check if the entered password is included in the saved pwords
      redirect '/get_name?password=' + password
#if the password is included in my array of saved passwords, you are redirected to get_name erb
      else
        redirect '/wrong_pass?'
#if the password is not in the array, you are redirected to a wrong password page with the option to try again
    end
  
end

get '/get_name' do
  password = params[:password]
  erb :get_name, :locals => {:password => password}
end
post '/get_name' do
  fname = params[:fname].capitalize
  lname = params[:lname].capitalize
#after getting the first and last name, you are redirected to the math page
  redirect '/do_math?fname=' + fname + '&lname=' + lname
end
get '/wrong_pass' do
#this is the page you land on if your password is wrong
  password = params[:password]
  erb :wrong_pass
end
# 
post '/wrong_pass' do
redirect '/log2?'
#redirects to a second logon page
end
get '/log2'do 
# I added a retry page with a different message than the first logon page 
  erb :log2
end
post '/log2' do
password = params[:password]

  saved = ["steph", "doggy", "techy"]
        if password.include?(saved[0]) || password.include?(saved[1]) || password.include?(saved[2])
  
        redirect '/get_name?password=' + password
        else
        redirect '/wrong_pass?'
#at this point, the redirect is continuous until a correct password is entered or user quits
    end
  
end
get '/do_math' do
    # puts "made it to  get math do "

  fname = params[:fname]
    # puts "fname = #{fname}"
  lname = params[:lname]
    # puts = " lname = #{lname}"

  erb :do_math, :locals=> {:fname=> fname, :lname=> lname}
#Added puts statements in order to find errors in powershell
end
post '/do_math' do
    # puts "made it to poost do_math do"
  fname =  params[:fname]
    # puts "fname = #{fname}"
  lname = params[:lname]
    # puts "lname = #{lname}"
  num1 = params[:num1]
    # puts "num1 = #{num1}"
  num2 = params[:num2]
    # puts "num2 = #{num2}"
  math = params[:math]
#States which math function is selected
    # puts "math = #{math}"
  total = params[:total]
  total = calc(math, num1.to_f, num2.to_f)
#Changed numbers to a float to allow for decimals
    # puts "total = #{total}"
  redirect '/results?fname=' + fname + '&lname='+ lname + '&num1=' + num1 + '&num2=' + num2 + '&math=' + math + '&total=' + total
#Redirects to the results erb page
end
get '/results' do
    # puts "made it to get results do"
  fname =  params[:fname]
    # puts "fname = #{fname}"
  lname = params[:lname]
    # puts "lname = #{lname}"
  math = params[:math]
  num1 = params[:num1]
  num2 = params[:num2]
  total = params[:total]
  total = calc(math, num1.to_f, num2.to_f)
  erb :results, :locals=> {:fname=> fname, :lname=> lname, :math=> math, :num1=> num1, :num2=> num2, :total=> total}
end
post '/results' do
  # puts "made it to poost  results do"
  fname = params[:fname]
  # puts "fname = #{fname}"
  lname = params[:lname]
  # puts "lname = #{lname}"
#displays the results of the math function and numbers selected, and a redirect to try over with new selections.
  redirect '/do_math?fname=' + fname + '&lname='+ lname 
end

  
     
    