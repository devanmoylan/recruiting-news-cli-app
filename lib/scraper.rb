class Scraper
  puts "Scraper class is being run"

  def initialize(path = default_path)
    @posts = []
    @path = path
    @page = Nokogiri::HTML(open(path))
  end

  def gather_posts_from_scouts
    @page.css(".story-list-item").first(10).each_with_index do |post, index|
      @posts[index] = {
        :title => post.css(".story-deck h1 a span").last.text,
        :author => post.css(".story-deck .story-from").text,
        :time => post.css(".story-deck .time-stamp").text,
        :description => post.css(".story-deck p").text,
        :link => post.css(".story-deck .story-stuff a").attribute("href").value
      }
    return false if @posts.empty?
    end
  end

  def gather_posts_from_bleacher_report
    @page.css(".articleSummary").first(10).each_with_index do |post, index|
      @posts[index] = {
        :title => post.css(".articleContent .articleTitle h3").text,
        :author => post.css(".articleContent .authorInfo a .name").text + " " + post.css(".provider").text,
        :time => Time.now,
        :description => "",
        :link => post.css(".articleContent .articleTitle").attribute("href").value
      }
    return false if @posts.empty?
    end
  end

  def gather_posts_from_247sports
    @page.css(".news-feed-list li").first(10).each_with_index do |post, index|
      @posts[index] = {
        :title => post.css("div h3").text,
        :author => "via 247sports",
        :time => post.css("div span").text,
        :description => "",
        :link => post.css("a").attribute("href").value
      }
    return false if @posts.empty?
    end
  end

  def create_new_post
    @posts.each {|post| Post.new(post)}
  end

  def run_scrape_on_scouts
    if !@page.nil? && gather_posts_from_scouts
      create_new_post
    end
  end

  def run_scrape_on_bleacher_report
    if !@page.nil? && gather_posts_from_bleacher_report
      create_new_post
    end
  end

  def run_scrape_on_247sports
    if !@page.nil? && gather_posts_from_247sports
      create_new_post
    end
  end

  def default_path
    "http://www.scout.com/college/football/recruiting/news?type=stories&sortBy=Date&site=ScoutFootball.com"
  end

end
