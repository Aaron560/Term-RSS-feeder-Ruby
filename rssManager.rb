#methods importing URI handlers and HTML parser methods, Relative import from rss data.
require "open-uri"
require "nokogiri"
require_relative "rssData.rb"

#----------------------------------------------------------------
#Rss_func parses the given URI and returns the corresponding string using the begin method with default of nil being returned if no string is found.
class RSS_func
  def loadRssChannelFromUrl(rssUrl)
    xml_Doc = Nokogiri::XML(URI.open(rssUrl))

    rssChannelNode = xml_Doc.root.at_xpath("channel")

    rssChannel = RSS_Channel.new

    #Carves Channel title from HTML document.
    begin
      rssChannel.Title = xml_Doc.root.at_xpath("channel/title").content
    rescue
      rssChannel.Title = "NIL"
    end

    #Carves Channel description from HTML document.
    begin
      rssChannel.Description = rssChannelNode.at_xpath("description").content
    rescue
      rssChannel.Description = "NIL"
    end

    #Carves channel link from the HTML document.
    begin
      rssChannel.Link = rssChannelNode.at_xpath("link").content
    rescue
      rssChannel.Link = "NIL"
    end

    #optional channel publish date
    begin
      rssChannel.PubDate = rssChannelNode.at_xpath("pubdate").content
    rescue
      rssChannel.PubDate = "NIL"
    end

    rssChannel.RssItems = loadRssItemsFromUrl(rssUrl)

    return rssChannel
  end

  # loads the given HTML context items from the RSS feed and loops through them based on the nodes range.
  def loadRssItemsFromUrl(rssUrl)
    xml_Doc = Nokogiri::XML(URI.open(rssUrl))

    rssItemNodes = xml_Doc.root.xpath("channel/item")

    rssItems = []

    for index in 0..rssItemNodes.length - 1
      rssItem = RSS_Item.new

      # Item title
      begin
        rssItem.Title = rssItemNodes[index].at_xpath("title").content
      rescue
        rssItem.Title = "NIL"
      end

      # Item Description
      begin
        rssItem.Description = rssItemNodes[index].at_xpath("Description").content
      rescue
        rssItem.Description = "NIL"
      end

      # Item Link
      begin
        rssItem.Link = rssItemNodes[index].at_xpath("link").content
      rescue
        rssItem.Link = "NIL"
      end

      # Item Publosh Date
      begin
        rssItem.PubDate = rssItemNodes[index].at_xpath("pubDate").content
      rescue
        rssItem.PubDate = "NIL"
      end

      rssItems.push(rssItem)
    end

    return rssItems
  end
end
