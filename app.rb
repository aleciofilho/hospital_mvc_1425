require 'csv'
require_relative './models/patient'
require_relative './repositories/patient_repository'
require_relative './controllers/patients_controller'
require_relative './views/patients_view'
require_relative './models/room'
require_relative './repositories/room_repository'
require_relative './controllers/rooms_controller'
require_relative './views/rooms_view'
require_relative 'router'

patients_csv = './data/patients.csv'
rooms_csv = './data/rooms.csv'

room_repository = RoomRepository.new(rooms_csv)
rooms_controller = RoomsController.new(room_repository)

patient_repository = PatientRepository.new(patients_csv, room_repository)
patients_controller = PatientsController.new(patient_repository, room_repository)


router = Router.new(patients_controller, rooms_controller)


router.run