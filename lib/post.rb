require 'pry'

class Post
  puts "Post class is being run"

  attr_accessor :title, :author, :time, :description, :link

  @@all = []

  def initialize(attributes)
    attributes.map {|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

end
