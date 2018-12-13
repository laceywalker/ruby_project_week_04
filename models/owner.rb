require_relative('../db/sql_runner')

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











end
