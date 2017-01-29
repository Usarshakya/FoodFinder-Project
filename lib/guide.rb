require 'resturant'

class Guide

	def initialize(path=nil)
		#locate the resturant text file at path
		Resturant.filepath = path
		if Resturant.file_exists?
			puts "Found Resutrant file"
		#or create a new file
		elsif Resturant.create_file
			puts "Created resturant file" 
		# exit if create fails
		else
			puts "Exiting...\n\n"
			exit!
		end
	end

	def launch
		introduction
		conclusion
	end

	def introduction
		puts "\n\n<<<WELCOME TO THE FOODFINDER>>>\n\n"
		puts "This is an interactive guide to help you find the food you crave.\n\n"
	end

	def conclusion
		puts "\n<<<GUDBYE>>>\n\n\n"
	end

end