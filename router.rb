class Router
  def initialize(patients_controller, rooms_controller, doctors_controller, appointments_controller)
    @patients_controller = patients_controller
    @rooms_controller = rooms_controller
    @doctors_controller = doctors_controller
    @appointments_controller = appointments_controller
  end

  def run
    puts "Welcome to Hospital MVC"
    loop do
      print_action
      action = gets.chomp.to_i
      dispatch(action)
    end    
  end

  private

  def print_action
    puts "\nWhat do you want to do next?"
    puts "1 - Register a room"
    puts "2 - List all rooms"
    puts "3 - Register a patient"
    puts "4 - List all patients"
    puts "5 - Cure patient"
    puts "6 - Register a doctor"
    puts "7 - List all doctors"
    puts "8 - Create a new appointment"
    puts "0 - Exit"
  end

  def dispatch(action)
    case action
    when 1
      @rooms_controller.add
    when 2
      @rooms_controller.list
    when 3
      @patients_controller.add
    when 4
      @patients_controller.list
    when 5
      @patients_controller.cure
    when 6
      @doctors_controller.add
    when 7
      @doctors_controller.list
    when 8
      @appointments_controller.add
    when 0
      puts "Goodbye!"
      exit
    else
      puts "Not a valid option"
    end
  end
end