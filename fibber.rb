
class Fibber

  # the easy way
  def self.fibonacci(number)
    if number <= 0
      return [0]
    else
    	# if number is 1 the seed array is returned
    	# otherwise append the sum of the last two items in the array
      2.upto(number).reduce([0,1]) do |total, n|
        total << total[-2] + total[-1]
      end
    end
  end


 	#  # the slightly more difficult way
	# def self.fibonacci(number)
	# 	if number <= 0
	# 		return [0]
	# 	end

	# 	# set the seed values
	# 	x = 0
	# 	y = 1
	# 	result = [x, y]		# [0, 1]

	# 	(2..number).each do |n|
	# 		result[n] = x + y
	# 		x = y
	# 		y = result[n]
	# 	end

	# 	return result

	# end


	# # the recursive way
	# def self.fibonacci(number)
	# 	results = []
	# 	0.upto(number) do |n|
	# 		results << fibonacci_value(n)
	# 	end
	# 	results
	# end

	# def self.fibonacci_value(number)
	# 	if number <= 0
	# 		result_value = 0
	# 	elsif number == 1
	# 		result_value = 1
	# 	else
	# 		# use recursion to get the value
	# 		result_value = fibonacci_value(number - 1) + fibonacci_value(number - 2)
	# 	end
	# end



	# output
	ROW_SIZE = 5

	def self.output(number, type)
		fibonacci_sequence = fibonacci(number)
		number_of_lines = (fibonacci_sequence.size / 5.0).ceil.to_i

		case type
		when 'jagged'
			return jagged_output( fibonacci_sequence, number_of_lines )
		when 'better'
			justification = 4
			return better_output( fibonacci_sequence, number_of_lines,
													  justification )
		else
			justification = fibonacci_sequence.last.to_s.length + 1
			return fancy_output( fibonacci_sequence, number_of_lines,
												   justification )
		end
	end


	def self.jagged_output( fibonacci_sequence, number_of_lines )
		output = ""

		1.upto(number_of_lines) do |line|
			row = fibonacci_sequence.shift(ROW_SIZE)

			output << row.join(' ') + "\n"
		end

		return output
	end


	def self.better_output( fibonacci_sequence, number_of_lines,
									  			justification )
		output = ""

		1.upto(number_of_lines) do
			row = fibonacci_sequence.shift(ROW_SIZE)

			row.each do |item|
				item_string = item.to_s.rjust( justification )
				output << item_string
			end

			output << "\n"
		end

		return output
	end


	def self.fancy_output( fibonacci_sequence, number_of_lines,
									  		 justification )
		output = ""

		1.upto(number_of_lines) do
			row = fibonacci_sequence.shift(ROW_SIZE)

			row.each do |item|
				text = item.to_s.rjust( justification )
				output << text
			end

			output << "\n"
		end

		return output
	end

end		# end class def


if __FILE__ == $PROGRAM_NAME
	quantity = 15
	puts Fibber.output( quantity, 'jagged' )
	puts
	puts Fibber.output( quantity, 'better' )
	puts

	quantity = 29
	puts Fibber.output( quantity, 'fancy' )
end
