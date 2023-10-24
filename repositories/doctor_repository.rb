class DoctorRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @doctors = []
    load_csv
    @next_id = @doctors.empty? ? 1 : @doctors.last.id + 1
  end

  def create(doctor)
    doctor.id = @next_id
    @next_id += 1
    @doctors << doctor
    save_csv
  end

  def all
    @doctors
  end

  def find(doctor_id)
    @doctors.find { |doctor| doctor.id == doctor_id }
  end
  
  def find_by_index(index)
    @doctors[index]
  end

  private 

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %i[id name]
      @doctors.each do |doctor|
        csv << [doctor.id, doctor.name]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      name = row[:name]
      @doctors << Doctor.new(id: id, name: name)
    end
  end
end