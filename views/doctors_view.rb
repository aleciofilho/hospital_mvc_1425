class DoctorsView
  def ask_for_name
    puts "What's the doctor's name?"
    gets.chomp
  end

  def display_all(doctors)
    doctors.each_with_index do |doctor, i|
      puts "#{i + 1} - Dr. #{doctor.name}"
    end
  end
end