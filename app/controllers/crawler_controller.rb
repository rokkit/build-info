require "nokogiri"
require "open-uri"

class CrawlerController < ApplicationController
  def parse
    crawler = WebCrawlers::Crawler.new
    crawler.parse "http://emls.ru/flats/?query=r1/1/r2/1/r3/1/reg/2/dept/2/dist/39/sort1/7/dir1/1/s/1/sort2/1/dir2/2/interval/3"
  end
end
