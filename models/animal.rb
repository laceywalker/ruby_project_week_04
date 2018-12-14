require_relative('../db/sql_runner')
require_relative('owner')
require('pry')

class Animal

  attr_reader :name, :type, :available, :admission_date, :id, :owner_id

  def initialize(options)
    @name = options['name']
    @type = options['type']
    @admission_date = options['date']
    @available = options['available']
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end


  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      admission_date,
      available,
      owner_id

    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @admission_date, @available, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

    def self.find(id)
      sql = "SELECT * FROM animals
      WHERE id = $1"
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

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  # def owner()
  #   sql = "SELECT * FROM owners INNER JOIN adoption_records ON adoption_records.owner_id = owners.id WHERE adoption_records.animal_id = $1;"
  #   values = [@id]
  #   owners = SqlRunner.run(sql, values)
  #   return owners.map { |owner| Owner.new(owner) }
  # end





end
