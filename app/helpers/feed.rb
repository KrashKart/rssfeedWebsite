class Feed
  attr_reader :title
  attr_reader :link
  attr_reader :description
  attr_reader :headlines

  def initialize(title, link, description, headlines)
      @title = title
      @link = link
      @description = description
      @headlines = headlines
  end
end