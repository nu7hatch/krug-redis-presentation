## Atomic operations

    $ redis-cli set foo 10
    
    $ redis-cli
    $ multi
    $ get foo
    $ set foo 20
    $ exec
    10
    20
    
Is the same as:
    
    $ redis-cli getset foo 20

