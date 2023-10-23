class Room
  attr_reader :number, :capacity, :patients
  attr_accessor :id
  
  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity]
    @patients = []
  end

  def add_patient(patient)
    patient.room = self
    @patients << patient
  end
end