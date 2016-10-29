def input_students
  puts "Please enter the names of the students"
  puts "Then add cohort, age, height and country of birth:"
  students = []
  name = gets.chop
  while !name.empty? do
    cohort = gets.chomp
    if cohort.empty?
      cohort = "November"
    end
    age = gets.chomp
    height = gets.chomp
    country = gets.chomp
    students << {name: name, cohort: cohort, age: age, height: height, country: country}
    puts "Now we have #{students.count} students"
    name = gets.chop
  end
  students
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def cohort_print(students)
  cohorts = []
  puts "Which cohort would you like to view?".center(80)
  students.each do |student|
    cohorts << student[:cohort]
  end
  puts cohorts.uniq
  cohort = gets.chomp
  puts "These are the students in the #{cohort} cohort:".center(80)
  students.each do |student|
    if student[:cohort] == cohort
      puts "#{student[:name]}".center(80)
    end
  end
end

def print(students)
  if !students.empty?
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  end
end

def print_specific(students)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12 && student[:name][0] == "C"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students".center(82)
  elsif names.count == 1
    puts "Overall, we have one great student".center(82)
  else
    puts "No students are enrolled in Villains Academy".center(82)
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
