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

@directory = []
puts "Student Directory, v0.0.2 by WDI"
print "Enter Student or Instructor, pretty l to load & q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do


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

  when 'l'
    @directory << YAML.load_documents(File.open('student_directory.yml')) {|f| f}
    
  end
  
  # Append this to our yaml file
  @directory << person
  #binding.pry
  
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f|
 @directory.compact.each do |person|
f.write(person.to_yaml) 
end 
} 