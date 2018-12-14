class Adoption

  attr_reader :animal_id, :owner_id;

  def initialize(options)
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
    @date_adopted = options['date_adopted']
  end


  def save()
    sql = "INSERT INTO adoption_records
    (
      animal_id,
      owner_id,
      date_adopted
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@animal_id, @owner_id, @date_adopted]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM adoption_records;"
    SqlRunner.run(sql)
  end



end
