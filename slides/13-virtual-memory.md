## Virtual Memory

* usually both keys and values are in memory
* values can be swapped out to disk when they are rarely used
* when enabling VM is a good idea...?
* faster keys lookup - slower access to values
* _vm-max-memory_ - when redis should start swapping
* _vm-pages_, _vm-page-size_ (e.g. 100M and 32B)
