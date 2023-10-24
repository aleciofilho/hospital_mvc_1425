class DoctorsController
  def initialize(doctor_repository)
    @doctor_repository = doctor_repository
    @doctors_view = DoctorsView.new
  end

  def add
    name = @doctors_view.ask_for_name
    doctor = Doctor.new(name: name)
    @doctor_repository.create(doctor)
  end

  def list
    doctors = @doctor_repository.all
    @doctors_view.display_all(doctors)
  end
end