## Queues

* list can acts as queue
* blocking operations - `BLPOP`, `BRPOP`

      while what = redis.blpop("forfiter", 30) 
        if what = "cziken"
          forfiter.eat!("cziken")
        else
          gara_muwap!
        end
      end
      
      redis.lpush "forfiter", "cziken"
      redis.lpush "forfiter", "gerari hir!"
      
 * remember about `:thread_safe` option!
