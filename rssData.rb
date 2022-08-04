#Defines Rss Channel and Rss items with class params.
class RSS_Channel
  def Title=(x)
    @Title = x
  end

  def Title
    @Title
  end

  def Description=(x)
    @Description = x
  end

  def Description
    @Description
  end

  def Link=(x)
    @Link = x
  end

  def Link
    @Link
  end

  def PubDate=(x)
    @PubDate = x
  end

  def PubDate
    @PubDate
  end

  def RssItems=(x)
    @RssItems = x
  end

  def RssItems
    @RssItems
  end
end

class RSS_Item
  def Title=(x)
    @Title = x
  end

  def Title
    @Title
  end

  def Description=(x)
    @Description = x
  end

  def Description
    @Description
  end

  def Link=(x)
    @Link = x
  end

  def Link
    @Link
  end

  def PubDate=(x)
    @PubDate = x
  end

  def PubDate
    @PubDate
  end
end
