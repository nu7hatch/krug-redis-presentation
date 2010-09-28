## Sorted sets (zsets)

  * similar to sets, but every member has an associated score
  
        >> redis.zadd "forfiter", 6, "alt"
        => true
        >> redis.zadd "forfiter", 3, "muv"
        => true
        >> redis.zadd "forfiter", 2, "gary"
        => true
        >> redis.zrange "forfiter", 0, -1
        => ["gary", "muv", "alt"]
