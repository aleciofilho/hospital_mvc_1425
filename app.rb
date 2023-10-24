require 'csv'
require_relative './models/patient'
require_relative './repositories/patient_repository'
require_relative './controllers/patients_controller'
require_relative './views/patients_view'
require_relative './models/room'
require_relative './repositories/room_repository'
require_relative './controllers/rooms_controller'
require_relative './views/rooms_view'
require_relative './models/doctor'
require_relative './repositories/doctor_repository'
require_relative './controllers/doctors_controller'
require_relative './views/doctors_view'
require_relative './models/appointment'
require_relative './repositories/appointment_repository'
require_relative './controllers/appointments_controller'
require_relative './views/appointments_view'
require_relative 'router'

patients_csv = './data/patients.csv'
rooms_csv = './data/rooms.csv'
doctors_csv = './data/doctors.csv'
appointments_csv = './data/appointments.csv'

room_repository = RoomRepository.new(rooms_csv)
rooms_controller = RoomsController.new(room_repository)

doctor_repository = DoctorRepository.new(doctors_csv)
doctors_controller = DoctorsController.new(doctor_repository)

patient_repository = PatientRepository.new(patients_csv, room_repository)
patients_controller = PatientsController.new(patient_repository, room_repository)

appointment_repository = AppointmentRepository.new(appointments_csv, patient_repository, doctor_repository)
appointments_controller = AppointmentsController.new(appointment_repository, doctor_repository, patient_repository)


router = Router.new(patients_controller, rooms_controller, doctors_controller, appointments_controller)


router.run