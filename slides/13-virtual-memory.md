## Virtual Memory

* usually both keys and values are in memory
* values can be swapped out to disk when they are rarely used
* when enabling VM is a good idea...?
* faster keys lookup - slower access to values
* `vm-max-memory` - when redis should start swapping
* `vm-pages`, `vm-page-size` (e.g. 100M and 32B)
