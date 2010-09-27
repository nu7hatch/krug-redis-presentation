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

[http://github.com/nu7hatch/react](http://github.com/nu7hatch/react)
