@students = []

def save_students
  #open file
  file = File.open("students.csv", "w")
  #Iterate over array and puts to file
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved successfully"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    #@students << {name: name, cohort: cohort.to_sym}
    add_student_to_array(name, cohort)
  end
  file.close
  puts "Students loaded successfully"
end

def add_student_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "sorry, #{filename} doesn't exist."
    exit
  end
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
    puts "I don't know what to do, try again.."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
  print_header()
  print_students_list
  print_footer
end



def input_students
  puts "Please enter the names of the students"
  puts "To Finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student_to_array(name, :november)
    #@students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
  
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu