require 'rubygems'
require 'yaml'
require 'pry'

def self.create_person(type)
  case type
  when "Student"
    Student.new
  when "Instructor"
    Instructor.new
  end
end

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :skydiving
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

begin
  Person.open_database "student_directory.db"
  puts "Student Directory, v0.0.3 by WDI & R"
  print 'Enter Student or Instructor, p to print, s to search, q to quit: '

  while ((input = gets.strip.chomp) != 'q') do

    case input
    when 'p'
      # Find all the people who are in the database 
      # and print out their information

    when 's'
      # Ask the user to enter a search term
      print "Please enter the search term that you're looking for: "
      search = gets.strip.chomp

      # Find all the people who's name matches the given string
      # and print out their information

    else
      # Create either a Student or Instructor object, depending on the input
      person = Person.create_person(input)

      unless person.nil?
        # Prompt the user for information about a Person
        person.ask_questions

        # Save someone in our database
        person.save
      end 
    end
  end

  def to_s
    "ID: #{self.id}"
    def save
    # Build a String of SQL, that will insert all the attributes into the persons table
    sql = "insert into people ('name', ) values (?,?,?,?)"
    # Execute the SQL on the @@db object
  end
end
rescue Exception => e
  puts "Error ! #{e}"
  puts "#{e.backtrace.join "\n"}"
ensure
  # Ensure that the database is closed before we go
  Person.close_database
end

case input
when "Student" 
  person = Student.new

  print "What is your name? "
  person.name = gets.strip.chomp
  print "What is your email? "
  person.email = gets.strip.chomp
  print "Have you ever been skydiving? "
  person.skydiving = gets.strip.chomp
  print "Tell me something about yourself :: "
  person.fun_fact = gets.strip.chomp
  print "What is your reason for joining GA? "
  person.reason_for_joining = gets.strip.chomp

when 'Instructor'
  person = Instructor.new

  print "What is your name? "
  person.name = gets.strip.chomp
  print "What is your email? "
  person.email = gets.strip.chomp
  print "Have you ever been skydiving? "
  person.skydiving = gets.strip.chomp
  print "Tell me something about yourself :: "
  person.fun_fact = gets.strip.chomp
  print "What is your reason for joining GA? "
  person.reason_for_joining = gets.strip.chomp
  print "What sort of instructor are you? "
  person.type = gets.strip.chomp
end