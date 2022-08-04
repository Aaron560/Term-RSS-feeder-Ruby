#Relative Imports to bring in other loca RB files.
require_relative "rssData.rb"
require_relative "rssManager.rb"

$stdout.flush

class Application
  def Execute
    $stdout.puts "Hello, please enter your url below: "
    $stdout.flush
    rssUrl = gets.chomp

    rssManager = RSS_func.new

    rssChannel = rssManager.loadRssChannelFromUrl(rssUrl)

    # channel info
    puts "channel title"
    puts rssChannel.Title
    puts "channel description"
    puts rssChannel.Description
    puts "channel link"
    puts rssChannel.Link
    # Items info
    for index in 0..rssChannel.RssItems.length - 1
      puts "Title"
      puts rssChannel.RssItems[index].Title

      puts "description"
      puts rssChannel.RssItems[index].Description

      puts "link"
      puts rssChannel.RssItems[index].Link
    end
  end
end

# application

application = Application.new
application.Execute
