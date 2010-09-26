# Redis

KRUG 28.09.2010

*Krzysztof Knapik, Krzysztof Kowalik* 

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

* There is only master-slave replication
* Your data is safe when is's in at least 3 data centers

Replication can be configured in `redis.conf` or live:

    SLAVEOF <masterip> <masterport>
    SLAVEOF no one
    
## Virtual memory

TODO:...

## Data types

* strings (up to 1 GB)
* lists of strings
* sets of strings
* sets with scores (sorted sets)
* hashes
* publish-subscribe channels

## Simple operations and conventions 

### Keys

* should be short for better performence
* common convention: object-type:id:field
* hashes like MD5 or SHA1

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

## Storing objects

TODO:...

## Lists

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

nest (n)
resque - Ost (n/k)
cache store  (k)
ruby i18n (k)
ACLatraz (n)
React (n)

