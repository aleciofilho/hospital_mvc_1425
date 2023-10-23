class RoomsController
  def initialize(room_repository)
    @room_repository = room_repository
    @rooms_view = RoomsView.new
  end

  def add
    number = @rooms_view.ask_for_number
    capacity = @rooms_view.ask_for_capacity
    room = Room.new(number: number, capacity: capacity)
    @room_repository.create(room)
  end

  def list
    rooms = @room_repository.all
    @rooms_view.display_all(rooms)
  end
end