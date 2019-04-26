require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
   cols =  DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        @table_name
      LIMIT
        0
    SQL
    cols = cols[0].map! {|col| col.to_sym}
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do 
        self.attributes[col]
      end
      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.tableize
  end

  def self.all
    results = DBConnection.execute1(<<-SQL)
      SELECT 
       #{table_name}.*
       FROM
       #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    objects
  end

  def self.find(id)
    results = DBConnection.execute1(<<-SQL, id)
      SELECT 
      #{table_name}.*
      FROM
      #{table_name}
      WHERE 
      #{table_name}.id = ?
    SQL
    self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      self.send("#{attr_name}=", value)
    end 
  end

  def attributes
    self.attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|inst| self.send(inst)}
  end

  def insert
    col_names = self.class.columns.drop(1).join(",")
    question_marks = (((self.class.columns.length)-1) * ["?"]).join(",")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO 
      #{self.class.table_name} (#{col_names})
      VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    col = self.class.columns.map {|attr| "#{attr} = ?"}
    col_names = col.join(",")
    DBConnection.execute(<<-SQL, *attribute_values, id)
    UPDATE
      #{self.class.table_name}
    SET
      {#{col_names}}
    WHERE
      #{self.class.table_name}.id = ?
    SQL
    
  end

  def save
    if self.find(id) == nil
      self.insert
    else
      self.update
    end
  end
end
