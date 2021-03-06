require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')
require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()

customer1 = Customer.new( 'name' => 'Craig', 'funds' => '50' )
customer1.save()
customer2 = Customer.new( 'name' => 'Simon', 'funds' => '35' )
customer2.save()
customer3 = Customer.new( 'name' => 'Matthew', 'funds' => '10' )
customer3.save()

film1 = Film.new( 'title' => 'Pulp Fiction', 'price' => '10' )
film1.save()
film2 = Film.new( 'title' => 'Reservoir Dogs', 'price' => '12' )
film2.save()
film3 = Film.new( 'title' => 'True Romance', 'price' => '8' )
film3.save()

ticket1 = Ticket.new( 'film_id' => film1.id, 'customer_id' => customer1.id )
ticket1.save()
ticket2 = Ticket.new( 'film_id' => film2.id, 'customer_id' => customer2.id )
ticket2.save()
ticket3 = Ticket.new( 'film_id' => film3.id, 'customer_id' => customer3.id )
ticket3.save()
ticket4 = Ticket.new( 'film_id' => film1.id, 'customer_id' => customer2.id )
ticket4.save()
ticket5 = Ticket.new( 'film_id' => film1.id, 'customer_id' => customer3.id )
ticket5.save()

screening1 = Screening.new( 'film_id' => film1.id, 'show_time' => '21:00' )
screening1.save()
screening2 = Screening.new( 'film_id' => film2.id, 'show_time' => '00:00' )
screening2.save()
screening3 = Screening.new( 'film_id' => film3.id, 'show_time' => '18:00' )
screening3.save()


binding.pry
nil


