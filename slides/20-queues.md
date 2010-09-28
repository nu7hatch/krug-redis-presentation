## Queues

  * list can acts as queue
  * blocking operations - `BLPOP`, `BRPOP`
  
        while what = redis.blpop("forfiter", 30) 
          if what = "cziken"
            forfiter.eat!("cziken")
          else
            gary_muvalt!
          end
        end
      
        redis.lpush "forfiter", "cziken"
        redis.lpush "forfiter", "gierary hirr!"
      
  * remember about `:thread_safe` option!
