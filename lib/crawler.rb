require 'open-uri'
require File.expand_path('../japanese-name', __FILE__)

class Crawler
  def initialize(url)
    @url = url
  end

  def get_names
    content = open(@url).read
    content && content.scan(/^(.+?)\s*\,(.+?),\d+,\d+/).collect do |hiragana, kanji|
      JapaneseName.new hiragana, kanji
    end
  end
end
