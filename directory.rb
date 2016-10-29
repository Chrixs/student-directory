@students = []

def input_students
  puts "\nPlease enter the names of the students"
  puts "Then add cohort\n "
  @name = $stdin.gets.chomp
  input_loop
end

def input_loop
  while !@name.empty? do
    @cohort = $stdin.gets.chomp
    if @cohort.empty?
      @cohort = "November"
    end
    push_to_students
    puts "\nNow we have #{@students.count} students\n "
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
  puts "\t1. Input the students"
  puts "\t2. Show the students"
  puts "\t3. Save to a file"
  puts "\t4. Load from a file"
  puts "\t9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      puts "\nOpening student input\n "
      input_students
    when "2"
      puts "\nShowing students\n "
      show_students
    when "3"
      puts "\nInitiating save function\n "
      save_students
    when "4"
      puts "\nInitiating load function"
      puts "What file would you like to load?"
      filename = $stdin.gets.chomp
      load_students(filename)
    when "9"
      puts "\nExiting program...\n "
      exit
    else
      puts "\nI don't know what you mean, try again\n "
  end
end

def save_students
  puts "What file would you like to save as?"
  save_file = $stdin.gets.chomp
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    File.open(save_file, "w") do |f1|
      puts csv_line
    end
  end
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
  if filename.nil?
    puts "\nNo filename given, loading default students file.\n "
    load_students
  elsif File.exists?(filename)
    load_students(filename)
     puts "\nLoaded #{@students.count} from #{filename}\n "
  else
    puts "\nSorry, #{filename} doesn't exist.\n "
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
