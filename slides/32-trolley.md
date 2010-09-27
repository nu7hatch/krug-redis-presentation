#### Trolley

* jobs are not methods
      Trolley[:myqueue].enqueue("send-hello-mail", @user)
      
      include Trolley::Helpers
      enqueue(:myqueue, "send-hello-mail", @user)
      
* elegant sinatra-like syntax in workers
      job "send-hello-mail" do |args|
        HelloMailer.deliver_greetings(*args)
      ends

* jobs execution monitoring (Google's Chubby like hub)
* can be used with AMQP

... coming soon =P
