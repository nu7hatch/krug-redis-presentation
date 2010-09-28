## Sets

  * unordered collections of redis strings
  
        >> redis.sadd "forfiter", "garymuvalt"
        => true
        >> redis.sadd "forfiter", "gieraryhirr"
        => true
        >> redis.sadd "forfiter", "cziken"
        => true
        >> redis.sadd "forfiter", "cziken"
        => false
        >> redis.spop "forfiter"
        => "gieraryhirr"
