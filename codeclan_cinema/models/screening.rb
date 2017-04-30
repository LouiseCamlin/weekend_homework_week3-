require_relative('../db/sql_runner.rb')

class Screening

  attr_accessor :time
  attr_reader :id, :film_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @film_id = params['film_id'].to_i if params['film_id']
    @show_time = params['show_time']
  end

  def save()
    sql = "INSERT INTO screenings (show_time) VALUES ('#{ @show_time }') RETURNING id"
    screening = SqlRunner.run(sql).first
    @id = screening['id'].to_i
  end

  def Screening.all()
    sql = "SELECT * FROM screenings"
    return Screening.get_many(sql)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = #{id};"
    SqlRunner.run(sql)
  end
 
  def Screening.delete_all() 
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE screenings (time) VALUES ('#{ @show_time }') RETURNING id"
    SqlRunner.run(sql)
  end

  def Screening.find(id)
    sql = "SELECT screenings.show_time FROM screenings WHERE id = #{id};"
    return Screening.get_many(sql)
  end

  def Screening.get_many(sql)
    screenings = SqlRunner.run(sql)
    return screenings.map { |screening| Screening.new(screening)}
  end

end