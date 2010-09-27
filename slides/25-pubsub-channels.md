## Pubsub channels 

    $ redis-cli subscribe chat
    $ redis-cli subscribe chat1 chat2 chat3
    $ redis-cli psubscribe chat.*
  
    $ redis-cli publish chat hello
    $ redis-cli publish chat KRUG!
