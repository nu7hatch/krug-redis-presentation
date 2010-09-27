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
