require_relative('../db/sql_runner')
require_relative('owner')
require('pry')

class Animal

  attr_accessor :animal_name, :type, :available, :admission_date, :id, :owner_id, :image

  def initialize(options)
    @animal_name = options['animal_name']
    @type = options['type']
    @admission_date = options['admission_date']
    @available = options['available']
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i if options['owner_id']
    @image = options['image']
  end


  def save()
    sql = "INSERT INTO animals (animal_name, type, admission_date, available, owner_id, image)
           VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@animal_name, @type, @admission_date, @available, @owner_id, @image]
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

  def owner() #presentation - this drove me insane, essentially newing up a blank at the bottom bc cannot call .name method on a string
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run(sql, values)
    if owner.count == 1
      return Owner.new(owner[0])
    else
      return Owner.new({})
    end
  end

  def update()
    sql = "UPDATE animals SET (animal_name, type, admission_date, available, owner_id) =
    ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@animal_name, @type, @admission_date, @available, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.search_animal(search)
     sql = "SELECT * FROM animals
             WHERE (type LIKE $1 OR name LIKE lower($1))"
     values = ["%#{search}%"]
     animals = SqlRunner.run(sql, values)
     return animals.map{|animal| Animal.new(animal)}
   end





end
