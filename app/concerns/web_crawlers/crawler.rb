class WebCrawlers::Crawler  
  
  def parse(url)
    page = Nokogiri::HTML(open(url))
    
    @output = page
  end
end