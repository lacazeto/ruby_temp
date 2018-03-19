valid_option = false
salary = -10 #arbitrary negative number
marriage_options = {
    'm' => "You are: Married.",
    's' => "You are: Single."
}

while !valid_option do
    puts "Please enter your marriage status:"
    m_status = gets.chomp

    if m_status == "M" || m_status == "m" || m_status == "S" || m_status == "s"
        valid_option = true
        puts marriage_options[m_status.downcase]

        until salary > 0
            puts "Please enter your salary:"
            salary = gets.chomp.to_f
        end

        case salary
        when 0..9275
            puts "Your tax rate is: 10%"
        when 9276..37650
            puts "Your tax rate is: 15%"
        else
            puts "Your tax rate is: 25%"
        end 

    else
        puts "Invalid response. Please try again."
    end
end
