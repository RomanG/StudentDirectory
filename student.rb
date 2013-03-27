require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name, :email, :github_user, :twitter, :fun_fact, :skydiving

def self.create_person(type)
  case type
  when "Student"
    Student.new
  when "Instructor"
    Instructor.new
  end
end
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

@directory = ""
puts "Student Directory, v0.0.2 by R Gun"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  person = nil
  person = Person.create_person(input.capitalize)

  print "What is your name? "
  person.name = gets.strip.chomp
  print "What is your email? "
  person.email = gets.strip.chomp
  print "Have you ever been skydiving? "
  person.skydiving = gets.strip.chomp
  print "Tell me something about yourself :: "
  person.fun_fact = gets.strip.chomp

  case input
  when "Student" 
    person = Student.new
    
    print "What is your reason for joining GA? "
    person.reason_for_joining = gets.strip.chomp
    
  when 'Instructor'
    person = Instructor.new
    
    print "What sort of instructor are you? "
    person.type = gets.strip.chomp
    
  end
  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) }