## Hashes

  * makes storing objects in Redis even easier
  * HSET, HGET, HMGET, HMSET, HINCRBY, HEXISTS, HDEL, HLEN, HKEYS, HVALS, HGETALL
        
        $ >> redis.hset "forfiter", "length", 4
        $ >> redis.hset "forfiter", "appearance", "bjutiful"
        $ >> redis.hgetall "forfiter"
        $ => {"appearance"=>"bjutiful", "length"=>"4"}
