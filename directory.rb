def input_students
  puts "Please enter the names of the students"
  puts "Then add age, height and country of birth:"
  students = []
  name = gets.chomp
  age = gets.chomp
  height = gets.chomp
  country = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, age: age, height: height, country: country}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    if !name.empty?
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

def print(students)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12 && student[:name][0] == "C"
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(82)
end

students = input_students
print_header
print(students)
print_footer(students)
