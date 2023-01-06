def input_students
  puts "Please enter the names of the students"
  puts "To Finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end 

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end
  
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

students = input_students
print_header()
print(students)
print_footer(students)