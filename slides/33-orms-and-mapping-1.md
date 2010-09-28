### ORMs and mapping ruby objects to redis types (1)
  
  * killer feature of Redis is allowing to perform atomic operations on individual data structures
  * using an ORM wrapper removes the atomicity
  * [http://github.com/tlossen/remodel](http://github.com/tlossen/remodel)

        class Forfiter < Remodel::Entity
          has_many :czikens, :class => 'Cziken', :reverse => :forfiter
          property :name, :class => 'String'
          property :size, :class => 'Integer'
        end

  * [http://github.com/whoahbot/dm-redis-adapter](http://github.com/whoahbot/dm-redis-adapter)

        class Cafe
          include DataMapper::Resource

          property :id,     Serial
          property :name,   Text
        end




