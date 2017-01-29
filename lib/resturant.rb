class Resturant

  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT,path)
  end

  attr_accessor :name, :cuisine, :price

  def self.file_exists?
    #class should know if the resturant file exists
    if @@filepath && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  def self.create_file
    #create resturant file
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?

  end

  def self.saved_resturants

  end

  def save
    return false unless Resturant.file_usable?
    File.open(@@filepath,'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end

end