class PatientsView
  def ask_for_name
    puts "What's the patient's name?"
    gets.chomp
  end
  
  def ask_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def display_all(patients)
    puts "-------------------------"
    puts "        Patients         "
    patients.each_with_index do |patient, i|
      puts "#{i + 1} - #{patient.name} (Room #{patient.room.number})"
    end
    puts "-------------------------"
  end
end