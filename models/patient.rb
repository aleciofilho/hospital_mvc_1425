class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attributes = {}) #Patient.new(name: 'Alécio', cured: true)
    @id = attributes[:id]
    @name = attributes[:name] # => 'Alécio'      key     value ,  key    value
    @cured = attributes[:cured] || false
  end

  # def room
  #   @room
  # end

  # def room=(new_room)
  #   @room = new_room
  # end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end