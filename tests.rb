=begin
class User
    def name  # reader method
      @name
    end
  
    def name=(str) # writer method
      @name = str
    end
end

user = User.new
puts user.name
user.name="Alan"
puts user.name
=end

class Vehicle
    def initialize(str)
        @make = str
    end

    attr_accessor :make

    def name  # reader method
        @name
    end
  
    def name=(str) # writer method
        @name = str
    end
end

class Moto < Vehicle

end

moto = Moto.new
puts moto.make
