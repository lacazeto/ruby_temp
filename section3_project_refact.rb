class Exercise2
  Infinity = 1.0/0

  def status=(new_status)
    @status = new_status if ["M","S"].include? new_status.upcase
  end

  def run
    ask_user_input
    show_tax_text(tax)
  end

  def tax
    married_taxes = {10 => 0..18550, 15 => 18551..75300, 25 => 75301..Infinity }
    single_taxes = {10 => 0..9275, 15 => 9276..37650, 25 => 37651..Infinity }

    taxes = married? ? married_taxes : single_taxes

    taxes.find {|k,v| v.include? @salary }.first
  end

  def ask_user_input
    status_input

    while !valid_status?
      puts "Invalid response. Please try again."
      status_input
    end

    puts status_text
    salary_input
  end

  def salary_input
    puts "please enter your salary: "
    @salary = gets.chomp.to_i
  end

  def status_input
    puts "Please enter your status:"
    @status = gets.chomp
  end

  def valid_status?
    married? || single?
  end

  def married?
    @status == "M"
  end

  def single?
    @status == "S"
  end

  def status_text
    if married?
      "You are: Married."
    else
      "You are: Single."
    end
  end

  def show_tax_text(tax)
    if tax >= 25
      puts "Your tax rate is: 25% or greater."
    else
      puts "Your tax rate is: #{tax}%."
    end
  end
end

Exercise2.new.run