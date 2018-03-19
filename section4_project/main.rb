$cars_params_list = []
$cars_list = {} 

class Car
  def initialize(doors,engine,color)
    @doors = doors
    @engine = engine
    @color = color
  end

  def self.import_cars (file)
    begin
      File.open(file, 'r') do |row|
        while text = row.gets
          car_doors, car_engine, car_color = text.split("|") 
          $cars_params_list << {
            doors: car_doors,
            engine: car_engine,
            color: car_color.chomp
          }  
        end
      end  
    rescue => exception
      puts exception
      exit 1
    end
  end

  def self.create_car_instances
    iterator = 1
    $cars_params_list.each do |car|
      $cars_list["Car#{iterator}"] = Car.new(car[:doors],car[:engine],car[:color])
      iterator +=1
    end
  end

  def self.show_car_instances
    $cars_list.each do |key, value|
      print key
      puts value.get_car_info # this could also be achieved by simply using the instance method "instance.instance_variable_get(:@variable)"
    end
  end

  def self.update_car_instances (n)
    print "Which car would you like to change? Choose a number between (1 - #{n}): "
    value = (gets.chomp).to_i - 1
    puts "Set new values (Number, Number, Text) for:"
    print "#{$cars_list.keys[value]}#{$cars_list.values[value].get_car_info} :"
    param1, param2, param3 = gets.chomp.split(",")
    $cars_list.values[value].update_car_info(param1, param2, param3)
  end
  
  def get_car_info
    " - Doors: #{@doors} | Cylinders: #{@engine} | Color: #{@color}"
  end

  def update_car_info (*params)
    params.each_index do |index|
      case index
      when 0
        @doors = params[0]
      when 1
        @engine = params[1]
      else
        @color = params[2]
      end
    end
  end
end

def main
  print "Choose the file name to be imported: "
  car_list_file = gets.chomp
  # car_list_file = "cars.txt"
  Car.import_cars car_list_file
  Car.create_car_instances
  loop do
    Car.show_car_instances
    print "Is this correct? (Y/N): "
    answer = gets.chomp.upcase
    until answer == "Y" || answer == "N"  
      print "Invalid option! Try again (Y/N): "
      answer = gets.chomp.upcase
    end
    if answer == "Y"
      break
    else
      Car.update_car_instances ($cars_list.length)
      puts "Updated cars list:"
    end
  end
end

###################

main