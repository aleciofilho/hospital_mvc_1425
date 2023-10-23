class RoomsView
  def ask_for_number
    puts "What's the room's number?"
    gets.chomp.to_i
  end

  def ask_for_capacity
    puts "What's the room's capacity?"
    gets.chomp.to_i
  end

  def display_all(rooms)
    puts "-------------------------"
    puts "          Rooms          "
    rooms.each_with_index do |room, i|
      puts "#{i + 1} - Room #{room.number}: #{room.patients.size}/#{room.capacity} capacity"
    end
    puts "-------------------------"
  end
end