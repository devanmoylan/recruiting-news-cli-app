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

  
end
