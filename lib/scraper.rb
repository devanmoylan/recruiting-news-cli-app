class Scraper
  puts "Scraper class is being run"

  def initialize(path = default_path)
    @posts = []
    @path = path
    @page = Nokogiri::HTML(open(path))
  end

  def gather_posts_from_scouts
    @page.css(".story-list-item").each_with_index do |post, index|
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
    binding.pry
    @page.css(".story-list-item").each_with_index do |post, index|
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

  def default_path
    "http://www.scout.com/college/football/recruiting/news?type=stories&sortBy=Date&site=ScoutFootball.com"
  end

end
