require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require('pry-byebug')

customer1 = Customer.new( 'name' => 'Craig', 'funds' => '50' )
customer1.save
customer2 = Customer.new( 'name' => 'Simon', 'funds' => '35' )
customer2.save
customer3 = Customer.new( 'name' => 'Matthew', 'funds' => '10' )
customer3.save

film1 = Film.new( 'title' => 'Pulp Fiction', 'price' => '10' )
film1.save
film2 = Film.new( 'title' => 'Reservoir Dogs', 'price' => '12' )
film2.save
film3 = Film.new( 'title' => 'True Romance', 'price' => '8')
film3.save

ticket1 = Ticket.new( 'film_id' => film1.id, 'customer_id' => customer1.id )
ticket1.save
ticket2 = Ticket.new( 'film_id' => film2.id, 'customer_id' => customer2.id )
ticket2.save
ticket3 = Ticket.new( 'film_id' => film3.id, 'customer_id' => customer3.id )
ticket3.save

binding.pry
nil


