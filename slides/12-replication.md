## Replication

* only master-slave replication
* slaves are able to accept other slaves connections
* non-blocking on the master side
* data is safe when it's in at least 3 data centers

Replication can be configured in `redis.conf` or live:

    SLAVEOF <masterip> <masterport>
    SLAVEOF no one
