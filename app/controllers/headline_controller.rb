require "net/http"
require "uri"

class HeadlineController < ApplicationController
  def home
  end

  def search
    @feed = nil
    @rssLink = params[:rsslink]

    if params[:rsslink] != ""
      response = access(params[:rsslink].strip)
      params[:rsslink] = ''
      @feed = parse(response)
    end
  end

  def parse(input)
    input = input.gsub("<![CDATA[", '').gsub("]]>", '')
    titles = input.scan(/<title>(.*?)<\/title>/).uniq().map{|i| i[0]}
    feedTitle = titles[0]
    headlines = titles[1..]
    description = input[/\<description\>(.*?)\<\/description\>/, 1]
    link = input[/\<link\>(.*?)\<\/link\>/, 1]
    return Feed.new(feedTitle, link, description, headlines)
  end

  def access(link)
    return Net::HTTP.get(URI.parse(link))
  end
end
