## Redis and Ruby in the wild

    $ gem install redis

    $ >> redis = Redis.new(:host => "10.0.1.1", :port => 6380, :db => 0)
    $ => #<Redis client v2.0.10 connected to redis://127.0.0.1:6379/0 (Redis v2.0.1)>

    $ >> redis.set "foo", "bar"
    $ => "OK"
    $ >> redis.get "foo"
    $ => "bar"
