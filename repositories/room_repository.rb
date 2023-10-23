class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def create(room)
    room.id = @next_id
    @next_id += 1
    @rooms << room
    save_csv
  end

  def all
    @rooms
  end

  def find(room_id)
    @rooms.find do |room| 
      room.id == room_id
    end
  end

  def find_by_index(index)
    @rooms[index]
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %i[id number capacity]
      @rooms.each do |room|
        csv << [room.id, room.number, room.capacity]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      number = row[:number].to_i
      capacity = row[:capacity].to_i
      @rooms << Room.new(id: id, number: number, capacity: capacity)
    end
  end
end