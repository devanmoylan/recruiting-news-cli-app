require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative '../lib/post'

puts "Scraper class is being run"

class Scraper

  def initialize(path = self.path)
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

end
