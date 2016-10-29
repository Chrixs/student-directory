@students = []

def input_students
  puts "Please enter the names of the students"
  puts "Then add cohort, age, height and country of birth:"
  name = gets.chomp
  while !name.empty? do
    cohort = gets.chomp
    if cohort.empty?
      cohort = "November"
    end
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_students_list
  if !@students.empty?
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(82)
  elsif @students.count == 1
    puts "Overall, we have one great student".center(82)
  else
    puts "No students are enrolled in Villains Academy".center(82)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
