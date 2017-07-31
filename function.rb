
def calc(math, num1, num2)
#Math = what math function is selected, num1 and num2 are the numbers selected
	if math == "plus"
#Tried to use + but would not display, don't know why.
		total = num1.to_f + num2.to_f
#Initially had .to_i in order to use in a math function, but changed to .to_f (float) in order to use decimals
	elsif math == '-'
		total = num1.to_f - num2.to_f
	elsif math == 'x'
		total = num1.to_f * num2.to_f
	elsif math == '/'
		total = num1.to_f / num2.to_f
	end
	total.to_s
#Changed the total back to a string to be called in the app.rb file
end