class PatientsController
  def initialize(patient_repository, room_repository)
    @room_repository = room_repository
    @patient_repository = patient_repository
    @patients_view = PatientsView.new
    @rooms_view = RoomsView.new
  end

  def add
    name = @patients_view.ask_for_name
    
    rooms = @room_repository.all
    @rooms_view.display_all(rooms)

    index = @patients_view.ask_for_index

    room = @room_repository.find_by_index(index)

    patient = Patient.new(name: name)
    
    room.add_patient(patient)
    
    @patient_repository.create(patient)
  end

  def list
    patients = @patient_repository.all
    @patients_view.display_all(patients)
  end

  def cure
    list
    index = @patients_view.ask_for_index
    @patient_repository.cure(index)
  end
end