class PatientRepository
  def initialize(csv_file_path, room_repository)
    @room_repository = room_repository
    @csv_file_path = csv_file_path
    @patients = []
    load_csv
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def all
    @patients
  end

  def cure(index)
    patient = @patients[index]
    patient.cure!
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %i[id name cured room_id]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      
      id = row[:id].to_i
      name = row[:name]
      cured = row[:cured] == "true" # 'false' == "true" => false
      room_id = row[:room_id].to_i

      room = @room_repository.find(room_id)

      patient = Patient.new(id: id, name: name, cured: cured)

      room.add_patient(patient)

      @patients << patient
    end
  end
end