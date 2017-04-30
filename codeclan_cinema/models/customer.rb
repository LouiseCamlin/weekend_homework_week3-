require_relative('../db/sql_runner.rb')
require_relative('./film.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @funds = params['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', #{ @funds }) RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    
    return Customer.get_many(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{id};"
    SqlRunner.run(sql)
  end
 
  def Customer.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{ name }, #{ funds })
         WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films
    sql = "SELECT films.title FROM films
          INNER JOIN tickets ON tickets.film_id = films.id
          WHERE customer_id = #{@id};"
    return Film.get_many(sql)
  end

  def number_of_tickets
    return films.count
  end

  def Customer.find(id)
    sql = "SELECT customers.name FROM customers WHERE id = #{id};"
    return Customer.get_many(sql)
  end

  def Customer.get_many(sql)
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end

  # def buy_ticket(price)
  #   sql = "SELECT funds FROM customers "

  #   customer.update
  # end

end