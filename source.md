# R^2 - Redis and Ruby in the wild 

Kraków Ruby Users Group 
28.09.2010

*Krzysztof Kowalik - Araneo* 
kriss.kowalik@gmail.com

*Krzysztof Knapik - Lunar Logic Polska* 
knapo@knapo.net

## Agenda

## What Redis actualy is...?

* REmote DIctionary Server

* A key-value store?
* A data structure server?
* Messaging middleware?
* Network accessible memory, cache?
* ... ?

## Main features

* Amazing speed 
* Single threaded non-blocking I/O
* Horizontal scalability
* Flexible datatypes
* It's changing mindset :)

## Thinking redis... when to use it?

* Cache
* Queues
* High load operations
* Large ammount of small data set
* When you are not afraid to lose recently updated data  

## Getting started

    $ git clone git://github.com/antirez/redis
    $ cd redis
    $ make
    $ ./redis-server
    
## Command line client

    $ ./redis-cli
    $ ./redis-cli -h localhost -p 6379
    $ ./redis-cli -i 4
    $ ./redis-cli set hello KRUG
    $ ./redis-cli get hello

## Database commands

  * SELECT - switches between 16 dbs (db0 is default)
  * MOVE - moves keys from one db to another
  * FLUSHDB, FLUSHALL - deletes keys in current/all dbs
  * DBSIZE, INFO
  * redis-stat (part of [redis-tools](http://github.com/antirez/redis-tools))

## Persistence  

### Snapshot

* more durable == less performant
* by default 15/5/1 mins when 1/10/10000 have changed
* SAVE/BGSAVE commands trigger a save

### Append Only Mode

* every command is written to append only file 
* recovery is slower
* BGREWRITEAOF recreates appendonly.aof file
* File is recreated automatically when it's too big

## Replication

* only master-slave replication
* non-blocking on the master side
* data is safe when it's in at least 3 data centers
* also for scalability, e.g. to perform heavy (read-only) queries like some SORT

Replication can be configured in `redis.conf` or live:

    SLAVEOF <masterip> <masterport>
    SLAVEOF no one
    
## Virtual Memory

* usually both keys and values are in memory
* values can be swapped out to disk when they are rarely used
* when enabling VM is a good idea...?
* faster keys lookup - slower access to values
* _vm-max-memory_ - when redis should start swapping
* _vm-pages_, _vm-page-size_ (e.g. 100M and 32B)

## Data types

* strings (up to 1 GB)
* lists of strings
* sets of strings
* sets with scores (sorted sets)
* hashes
* publish-subscribe channels

## Simple operations and conventions 

### Keys

* should be short for better performance and faster access
* common convention: object-type:id:field
* might be hashes like MD5 or SHA1

### Manipulating data

    $ set foo:bar:bla foobar
    $ get foo:bar:bla
    foobar
    $ del foo:bar:bla
    
    $ incr foo:bar
    1
    $ decr foo:bar
    0
    $ incrby foo:bar 10
    10

## Storing objects...

* serialization - JSON, Marshal dump (mainly for read-only data)
* multiple keys, eg:

    $ set user:1:name Chris
    $ set user:1:surname Kowalik
    $ set user:1:age 22 

* hashes

## (Linked) Lists

  * sequence of ordered elements
  * rapid adding elements independly of list size

    $ lpush foo bar
    $ rpush foo bla
    $ lrange foo 0 -1
    bla
    bar
    $ rpop foo
    bla
    
## Sorting 

TODO:...

## Queues

TODO: przykłady z ruby'ego

## Sets

TODO: przykłady z ruby'ego

## Sorted sets (zsets)

TODO: przykłady z ruby'ego

## Hashes

TODO: przykłady z ruby'ego

## Atomic operations

    $ SET foo 10
    
    $ MULTI
    $ GET foo
    $ SET foo 20
    $ EXEC
    10
    20
    
Is the same as:
    
    $ GETSET foo 20

## Pubsub channels 

TODO: przykłady z ruby'ego

## Redis and Ruby in the wild

    $ gem install redis

    $ >> redis = Redis.new(:host => "10.0.1.1", :port => 6380, :db => 0)
    $ => #<Redis client v2.0.10 connected to redis://127.0.0.1:6379/0 (Redis v2.0.1)>

    $ >> redis.set "foo", "bar"
    $ => "OK"
    $ >> redis.get "foo"
    $ => "bar"

### redis-store gem 

  * [http://github.com/honkster/redis-store](http://github.com/honkster/redis-store)
  * various redis stores for ruby web frameworks
  * session store
  * cache store
  * i18n backend
  
### ruby i18n

  * basic backend for key value stores
  * _I18n::Backend::KeyValue.new(@redis_or_tokyo_cabinet_store)_
  * store only needs to respond to three methods
  * _store#[](key), store#[]=(key, value), store#keys_

### Resque and Ost
  
  * TODO

### ORMs?:(

  * [http://github.com/whoahbot/dm-redis-adapter](http://github.com/whoahbot/dm-redis-adapter)
  * [http://github.com/voloko/redis-model](http://github.com/voloko/redis-model)
  * [http://github.com/tlossen/remodel](http://github.com/voloko/remodel)

### Ohm

  * [http://github.com/soveran/ohm](http://github.com/soveran/ohm)
  * object-hash mapping library for redis
  * TODO

### redis-objects

  * [http://github.com/nateware/redis-objects)](http://github.com/nateware/redis-objects)
  * maps redis types to ruby objects
  * easy to integrate directly with existing ORMs (AR, DM etc.)
  * TODO

### Others TODO

Easy namespacing for redis client.

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

[http://github.com/soveran/nest)](http://github.com/soveran/nest)

### ACLatraz

Redis based ACL system for ruby. 

* Extremaly fast (3000+ operations/s)
* Extremaly easy to use:
 
      user.is.admin?
      user.is.manager_of!(Product)
      user.is.owner_of?(@product)
      
      suspects user { 
        deny all
        allow :manager_of => Product
        allow :owner_of   => :product 
      }
      
* Flexible (can be used with Rails, Sinatra, Padirno, pure Ruby apps...)
      
[http://github.com/nu7hatch/aclatraz)](http://github.com/nu7hatch/aclatraz)

### React

Tool for activating shell scripts via queue.

* Inspiration:

      while [ 1 ] do
        redis-cli blpop restart-httpd 0
        apache2ctl graceful
      done
      
* Realization:

      # my_commands.yml
      restart_httpd: apache2ctl graceful
      reboot: shutdown -r now
        
      $ react my_commands.yml --queue "my:queue"
      $ redis-cli lpush my:queue restart_httpd
      $ redis-cli lpush my:queue reboot

[http://github.com/nu7hatch/react)](http://github.com/nu7hatch/react)

## Fresh ideas

* full text search engine
* comet broadcast
* queue-activated shell scripts
* prefix/wildcard autocomplete
* activity streams
* ...

## Bigdis

* even smaller and faster than redis...
* file-based storage
* key == filename
* value == file contents

Why do we need that? o_O

## Questions?

## Thank you!

  [http://code.google.com/p/redis](http://code.google.com/p/redis)
  [http://rediscookbook.org](http://rediscookbook.org)

