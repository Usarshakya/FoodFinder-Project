require 'resturant'

class Guide
  class Config
    @@actions = ['list','find','add','quit']
    def self.actions
      @@actions
    end
  end

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

  def launch!
    introduction 
    #action loop
    result = nil
    until result == :quit
      action = get_action     
      result = do_action(action)
    end
    conclusion
  end

  def get_action
    action = nil
    # keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions :" + Guide::Config.actions.join(", ") if action
      print ">"
      user_response = gets.chomp
      action = user_response.downcase.strip
      return action
    end
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing.."
    when 'find'
      puts "Finding..."
    when 'add'
      puts "Adding..."
    when 'quit'
      return :quit
    else
      puts "\nI dont understand that command"
    end 
  end

  def introduction
    puts "\n\n<<<WELCOME TO THE FOODFINDER>>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n<<<GUDBYE>>>\n\n\n"
  end

end