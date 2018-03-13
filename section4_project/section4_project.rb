@cars_list = []

class Car
  def initialize(tires,engine,color)
    @tires = tires
    @engine = engine
    @color = color
  end

  attr_accessor :name, :engine, :color
end


def import_cars (file)
  counter = 0

  File.open(file, 'r') do |row|
    while text = row.gets
      counter += 1
      car_tires, car_engine, car_color = text.split("|") 
      @cars_list << {
        tires: car_tires,
        engine: car_engine,
        color: car_color
      }  
    end
  end

end

import_cars "cars.txt"
puts @cars_list

# car1 = Car.new(car_tires,car_engine,car_color)