require_relative('../db/sql_runner')
require_relative('animal')
require('pry')

class Owner

  attr_accessor :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO owners (name)
    VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    owner = Owner.new(result)
    return owner
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owner_data = SqlRunner.run(sql)
    owners = map_items(owner_data)
    return owners
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner) }
  end

  def animal()
    sql = "SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id
           WHERE owners.id = $1;"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    return animals.map { |animal| Animal.new(animal) }
  end












end
