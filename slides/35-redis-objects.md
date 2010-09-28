### redis-objects

  * [http://github.com/nateware/redis-objects](http://github.com/nateware/redis-objects)
  * maps redis types to ruby objects
  * easy to integrate directly with existing ORMs (AR, DM etc.)

        class Team < ActiveRecord::Base
          include Redis::Objects
          
          counter :hits, start => 1
          list :czikens
        end

  * standalone usage (`Redis::Value, Redis::Counter, Redis::List, Redis::Hash, Redis::Sets etc.`)

         @counter = Redis::Counter.new('likes')
         @counter.increment
  
         @list = Redis::List.new('czikens')
         @list << 'cziken1' << 'cziken2'
         @list.values # ["cziken1", "cziken2"]






