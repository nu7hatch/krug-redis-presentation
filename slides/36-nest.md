### Nest

Namespacing made easy:

    >> event = Nest.new("event")
    >> @redis.set event[3][:name], "Redis Meetup"
    >> @redis.get event[3][:name]
    => "Redis Meetup"

    >> events = Nest.new("events", Redis.new)
    => "events"
    >> events.sadd(meetup)
    => true
    >> events.smembers
    => ["events:1"]
    >> events.del
    >> true
    
[http://github.com/soveran/nest](http://github.com/soveran/nest)
