class AppointmentsView
  def ask_for_date
    puts "When is the appointment? (dd/mm/yy)"
    gets.chomp
  end

  def ask_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end
end