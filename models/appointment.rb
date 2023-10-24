class Appointment
  attr_accessor :id
  attr_reader :date, :doctor, :patient

  def initialize(attributes = {})
    @date = attributes[:date]
    @id = attributes[:id]
    @doctor = attributes[:doctor]
    @patient = attributes[:patient]
  end
end