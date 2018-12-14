require_relative('../db/sql_runner')
require_relative('animal')
class Owner

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name

    )
    VALUES
    (
      $1
    )
    RETURNING id"
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
      sql = "SELECT * FROM owners
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql ,values).first
      owner = Owner.new(result)
      return owner
    end

    def self.all()
      sql = "SELECT * FROM owners"
      owner_data = SqlRunner.run(sql)
      owners = map_items(animal_data)
      return owners
    end

    # def animal()
    #   sql = "SELECT * FROM animals INNER JOIN adoption_records ON adoption_records.animal_id = animals.id WHERE adoption_records.owner_id = $1;"
    #   values = [@id]
    #   animals = SqlRunner.run(sql, values)
    #   return animals.map { |animal| Animal.new(animal) }
    # end











end
