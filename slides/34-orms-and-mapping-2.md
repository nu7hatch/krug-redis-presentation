### ORMs and mapping ruby objects to redis types (2)

  * [http://github.com/voloko/redis-model](http://github.com/voloko/redis-model)
      
        class Forfiter < Redis::Model
          field :name,      :string
          field :created,   :datetime
  
          list  :czikens,   :json
        end

  * [http://github.com/soveran/ohm object-hash mapping](http://github.com/soveran/ohm)

        class Forfiter < Ohm::Model
          attribute :name
          set :czikens, Cziken
          counter :likes
        end 

