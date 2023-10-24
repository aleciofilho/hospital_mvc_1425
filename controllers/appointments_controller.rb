class AppointmentsController
  def initialize(appointment_repository, doctor_repository, patient_repository)
    @appointment_repository = appointment_repository
    @doctor_repository = doctor_repository
    @patient_repository = patient_repository
    @appointments_view = AppointmentsView.new
    @doctors_view = DoctorsView.new
    @patients_view = PatientsView.new
  end

  def add
    date = @appointments_view.ask_for_date
    doctors = @doctor_repository.all
    @doctors_view.display_all(doctors)
    doctor_index = @appointments_view.ask_for_index
    doctor = @doctor_repository.find_by_index(doctor_index)
    
    patients = @patient_repository.all
    @patients_view.display_all(patients)
    patient_index = @appointments_view.ask_for_index
    patient = @patient_repository.find_by_index(patient_index)

    appointment = Appointment.new(date: date, doctor: doctor, patient: patient)
    @appointment_repository.create(appointment)
  end

end