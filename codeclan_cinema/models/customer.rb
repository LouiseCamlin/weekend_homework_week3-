require_relative('../db/sql_runner.rb')


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
 
 def Customer.delete_all() 
   sql = "DELETE FROM customers"
   SqlRunner.run(sql)
 end

  def Customer.get_many(sql)
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end


  def films
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON tickets.customer_id = films.id
          WHERE customer_id = #{@id}"
    return Film.get_many(sql)
  end


end