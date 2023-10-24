class AppointmentRepository
  def initialize(csv_file_path, patient_repository, doctor_repository)
    @csv_file_path = csv_file_path
    @patient_repository = patient_repository
    @doctor_repository = doctor_repository
    @appointments = []
    load_csv
    @next_id = @appointments.empty? ? 1 : @appointments.last.id + 1 
  end

  def create(appointment)
    appointment.id = @next_id
    @next_id += 1
    @appointments << appointment
    save_csv
  end

  private 

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      date = row[:date]
      doctor = @doctor_repository.find(row[:doctor_id].to_i)
      patient = @patient_repository.find(row[:patient_id].to_i)
      appointment = Appointment.new(id: id, date: date, doctor: doctor, patient: patient)
      @appointments << appointment
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %i[id date patient_id doctor_id]
      @appointments.each do |appointment|
        csv << [appointment.id, appointment.date, appointment.patient.id, appointment.doctor.id]
      end
    end
  end
end