
def calc(math, num1, num2)
	if math == "plus"
		total = num1.to_i + num2.to_i
	elsif math == '-'
		total = num1.to_i - num2.to_i
	elsif math == '*'
		total = num1.to_i * num2.to_i
	elsif math == '/'
		total = num1.to_i / num2.to_i
	end
	total.to_s
end