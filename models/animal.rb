require_relative('../db/sql_runner')
require_relative('owner')
require('pry')

class Animal

  attr_reader :animal_name, :type, :available, :admission_date, :id, :owner_id

  def initialize(options)
    @animal_name = options['animal_name']
    @type = options['type']
    @admission_date = options['admission_date']
    @available = options['available']
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end


  def save()
    sql = "INSERT INTO animals (animal_name, type, admission_date, available, owner_id)
           VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@animal_name, @type, @admission_date, @available, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    animal = Animal.new(result)
    return animal
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def owner()
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [@id]
    owners = SqlRunner.run(sql, values)
    return owners.map { |owner| Owner.new(owner) }
  end

  def update()
    sql = "UPDATE animals SET (animal_name, type, admission_date, available, owner_id) =
    ($1, $2, $3, $4, $5) WHERE id = $5"
    values = [@animal_name, @type, @admission_date, @available, @owner_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end








end
