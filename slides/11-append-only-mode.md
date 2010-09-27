## Persistence: Append Only Mode

* every command is written to append only file 
* recovery is slower
* `BGREWRITEAOF` recreates appendonly.aof file
* File is recreated automatically when it's too big
