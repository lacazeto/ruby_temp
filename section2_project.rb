puts "What's your full name?"
full_name = gets.chomp
first_name = full_name.split[0]
last_name = full_name.split.last

puts "What's your street address?"
full_address = gets.chomp
address_splitted = full_address.split(/(?<=\d)(?=[A-Za-z])|\s/) #spliting number from char and whitespaces
number_address = []

#copying number to a different variable while checking for invalid entry
address_splitted.each { |elem|
    if elem == "0"
        return puts "Invalid street number"
    elsif elem.to_i != 0
        number_address << elem  
    end
}

street_text = address_splitted - number_address #subtracting number from address
street_text.delete_if { |elem|  #expecting a char value for the block, removing everything else
    elem.length > 1
}

street_block = street_text[0]

puts "Your first name is: #{first_name}"
puts "Your last name is: #{last_name}"
puts "Your street number is: #{number_address.first}"
puts "Your street letter means: #{street_block}-Block"