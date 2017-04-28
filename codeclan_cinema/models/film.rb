require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @price = params['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', #{ @price }) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update()
    sql = "
    UPDATE films SET (title, price) = ('#{ title }, #{ price })
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Film.all()
    sql = "SELECT * FROM films"
    return Film.get_many(sql)
  end

  def Film.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON tickets.film_id = customers.id
          WHERE film_id = #{@id}"
    return Customer.get_many(sql)
  end

  def Film.get_many(sql)
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film)}
  end

end