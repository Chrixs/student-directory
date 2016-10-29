@students = []

def input_students
  puts "Please enter the names of the students"
  puts "Then add cohort, age, height and country of birth:"
  @name = $stdin.gets.chomp
  while !@name.empty? do
    @cohort = $stdin.gets.chomp
    if @cohort.empty?
      @cohort = "November"
    end
    push_to_students
    puts "Now we have #{@students.count} students"
    @name = $stdin.gets.chomp
  end
end

def push_to_students
  @students << {name: @name, cohort: @cohort.to_sym}
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    push_to_students
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  elsif filename.empty?
    puts "No filename given, loading default students file."
    load_students
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process($stdin.gets.chomp)
  end
end

try_load_students
interactive_menu
