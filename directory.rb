def input_students
  puts "Please enter the names of the students"
  puts "Then add cohort, age, height and country of birth:"
  students = []
  name = gets.chop
  cohort = gets.chomp
  if cohort.empty?
    cohort = "November"
  end
  age = gets.chomp
  height = gets.chomp
  country = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: cohort, age: age, height: height, country: country}
    puts "Now we have #{students.count} students"
    name = gets.chop
    if !name.empty?
      cohort = gets.chomp
      if cohort.empty?
        cohort = "November"
      end
      age = gets.chomp
      height = gets.chomp
      country = gets.chomp
    end
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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
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
  else
    puts "Overall, we have one great student".center(82)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
