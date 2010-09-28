## Replication

* only master-slave replication
* non-blocking on the master side
* data is safe when it's in at least 3 data centers
* also for scalability, e.g. to perform heavy (read-only) queries like some `SORT`

Replication can be configured in `redis.conf` or live:

    SLAVEOF <masterip> <masterport>
    SLAVEOF no one
