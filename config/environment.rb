#Requirements
require 'bundler'
Bundler.require
require "irb"
require 'pry'
require 'open-uri'
require 'nokogiri'
require 'irb'


#Libraries
require_relative "../lib/scraper.rb"
require_relative "../lib/post.rb"
require_relative "../lib/recruitings_news.rb"
require_relative "../lib/recruitings_news/version"
require_relative "../lib/recruitings_news/cli"

puts "Environment loaded"
