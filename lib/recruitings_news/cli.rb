#CLI controller
class RecruitingsNews::CLI
  puts "CLI is running"

  def call
    list_news
    news_options
  end

  def list_news
    puts "The most recent recruiting news:"
    puts <<-DOC
    1. Devan stands out!
    2. Great new recruit!
    DOC
  end

  def news_options
    input = nil
    while input != "exit"
      puts "Recruiting news sources:"
      puts "1 - for Scout \n2 - for Bleacher Report \n3 - for Rivals \nexit - to exit"
      input = gets.strip.downcase
      case input
        when "1" then puts "Loading News from Scout"
        when "2" then puts "Loading News from Bleacher Report"
        when "3" then puts "Loading News from Rivals"
        when "exit" then puts "Exiting news sources"
        else puts "Not an option."
      end
    end
  end

end
