class Student
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name, grade, id=nil)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
      id INTERGER PRIMARY KEY,
      name TEXT
      grade TEXT
      )
      SQL
      
      DB[:conn].execute(sql) 
  end
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE students
    SQL
    
    DB[:conn].execute(sql)
    
  end
 
 
 
  def save
    sql = <<-SQL
    INSERT INTO students
    VALUES (?, ?)
    SQL
    
      
      DB[:conn].execute(sql, self.name, self.grade)
 
  end


  
end
