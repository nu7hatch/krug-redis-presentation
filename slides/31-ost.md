#### Ost

Makes it easy to enqueue object ids and process them with workers

    # in your app
    Ost.connect port: 6380, db: 2
    Ost[:rss_feeds] << @feed.id

    # in worker.rb
    require "ost"

    Ost[:videos_to_process].each do |id|
      # Do something with it!
    end
    
    $ ruby worker.rb
