#### Resque

* resque bg job - any ruby class/module responding to perform

      class ForfiterWorker
        @queue = :gierary_hirr
        
        def self.perform(forfiter_id, no_of_cziekns)
          forfiter = Forfiter.find(forfiter_id)
          forfiter.eat_cziken(no_of_cziekns)
        end
      end

      class Forfiter
        def async_give_cziken(amount = 4)
          Resque.enqueue(ForfiterWorker, self.id, amount)
        end
      end

      QUEUE=* rake resque:work

* [redis-namespace](http://github.com/defunkt/redis-namespace): `Resque.redis.namespace = "aligator"`
* [http://github.com/defunkt/resque](http://github.com/defunkt/resque)
