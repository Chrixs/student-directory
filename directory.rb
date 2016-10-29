@students = []

def input_students
  puts "Please enter the names of the students"
  puts "Then add cohort, age, height and country of birth:"
  name = gets.chop
  while !name.empty? do
    cohort = gets.chomp
    if cohort.empty?
      cohort = "November"
    end
    age = gets.chomp
    height = gets.chomp
    country = gets.chomp
    @students << {name: name, cohort: cohort, age: age, height: height, country: country}
    puts "Now we have #{@students.count} students"
    name = gets.chop
  end
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def cohort_print
  cohorts = []
  puts "Which cohort would you like to view?".center(80)
  @students.each do |student|
    cohorts << student[:cohort]
  end
  puts cohorts.uniq
  cohort = gets.chomp
  puts "These are the students in the #{cohort} cohort:".center(80)
  @students.each do |student|
    if student[:cohort] == cohort
      puts "#{student[:name]}".center(80)
    end
  end
end

def print_students_list
  if !@students.empty?
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  end
end

def print_specific
  @students.each.with_index(1) do |student, index|
    if student[:name].length < 12 && student[:name][0] == "C"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
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
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
