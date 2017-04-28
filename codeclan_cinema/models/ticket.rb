require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @film_id = params['film_id'].to_i if params['film_id']
    @customer_id = params['customer_id'].to_i if params['customer_id']
  end

  def save()
    sql = "INSERT INTO tickets ( customer_id, film_id ) VALUES ( #{ @customer_id}, #{ @film_id } ) RETURNING id;"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "
    UPDATE tickets SET (film_id, customer_id) = (#{ film_id }, #{ customer_id })
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Ticket.all()
    sql = "SELECT * FROM tickets"
    return Ticket.get_many(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def Ticket.delete_all() 
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def Ticket.get_many(sql)
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket)}
  end

end