class Person
  attr_accessor :id
  attr_accessor :type
  attr_accessor :name
  attr_accessor :email
  
  # Get a reference to the database (HINT - don't need to change this)
  #
  def self.open_database(name)
    @@db = SQLite3::Database.new(name)
  end

  # Close the database (HINT - don't need to change this)
  #
  def self.close_database
    @@db.close
  end

  # Only used for the tests, don't need to call, you can just use @@db
  def self.db
    @@db
  end

  # Builds either a Student or an Instructor, depending on the value of type
  #
  def self.create_person(type)
    case type
    when 'Student' 
      Student.new
    when 'Instructor'
      Instructor.new
    else
      nil
    end
  end

  # TODO - Return an array of either Student or Instructor objects, using information
  # stored in the database
  #
  def self.all
    people = []
    
    # Build a SQL String that will lookup all people in the database

    #sql = "select * from people"

    lookup = @@db.execute("select * from people")
    lookup.each do |db_object|
      person = Person.create_person(db_object[1])
      binding.pry
    
      #Set student / instructor attributes
      person.id = db_object[0]
      person.type = db_object[1]
      person.name = db_object[2]
      person.email = db_object[3]

      # Via Dan, much nicer syntax
      # person.id, person.type, person.name, person.email = db_object[0..3]
      
      #p.set_extra_fields
      #def set_extra_fields(result)
      #self.reason_for_joining = result[4]

      if person.type == "Student"
        person.reason_for_joining = db_object[4]
      elsif person.type == "Instructor"
        person.iq = db_object[5]
      else
        puts "Danger Will Robinson"
      end

binding.pry
      people << person
    end

  return people
end

    # # Execute the SQL on @@db
    # @@db do lookup

    #results = @@db.execute(sql)

    # # Iterate through each result, and build either a Student or an Instructor,
    # # filling in the information as you go.

    # results.each.do |row|
    # type = row[1]


    # while cycle > 0 do 
    #  x = 0 
    #  unless (x+1 =< people.length)
    #  end

  # TODO - Return an array of either Student or Instructor objects, using information
  # stored in the database, where the name matches the given argument
  #
  def self.find_by_name(name)
    people = []
    
    # Build a SQL String that will lookup all people in the database
    # where the name matches

    # Execute the SQL on @@db

    # Iterate through each result, and build either a Student or an Instructor,
    # filling in the information as you go.

    return people
  end

  # Prompt the user for some questions, common to all Person classes
  #
  def ask_questions
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
  end
end