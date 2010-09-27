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
