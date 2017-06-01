#CLI controller
class RecruitingsNews::CLI
  puts "CLI is running"

  def call
    news_source_options
  end

  def list_all_news
    puts "The most recent recruiting news:"
    Post.all.each {|post| puts "\n\nSubject: #{post.title}\n#{post.author}\n#{post.description}\nLearn more at #{post.link}"}
  end

  def news_source_options
    input = nil
    while input != valid_exit
      puts "\n\nSelect a recruiting news source:"
      puts "    1 - for Scout \n    2 - for Bleacher Report \n    3 - for 247sports \n    exit - to exit"
      input = gets.strip.downcase
      case input
        when "1" then puts "\nLoading News from Scout...\n"
          load_news_from_scouts
        when "2" then puts "\nLoading News from Bleacher Report...\n"
          load_news_from_bleacher_report
        when "3" then puts "\nLoading News from 247sports...\n"
          load_news_from_247sports
        when "exit" then puts "\nExiting news sources. Enjoy your day.\n"
          break
        else puts "\nNot an option.\n"
      end
      number_of_posts_loaded
      Post.reset!
    end
  end

  def number_of_posts_loaded
    puts "\n#{Post.all.count} posts loaded.\n" unless Post.all.count == 0
  end

  def valid_exit
    "exit" || "Exit"
  end

  def load_news_from_scouts
    scraper = Scraper.new(scout_path)
    scraper.run_scrape_on_scouts
    print_out_news
  end

  def load_news_from_bleacher_report
    scraper = Scraper.new(bleacher_report_path)
    scraper.run_scrape_on_bleacher_report
    print_out_news
  end

  def load_news_from_247sports
    scraper = Scraper.new(path_247sports)
    scraper.run_scrape_on_247sports
    print_out_news
  end

  def print_out_news
    Post.all.each {|post| puts "\n\nSubject: #{post.title}\n#{post.author}\n#{post.description}\nLearn more at #{post.link}\n"}
  end

  def scout_path
    "http://www.scout.com/college/football/recruiting/news?type=stories&sortBy=Date&site=ScoutFootball.com"
  end

  def bleacher_report_path
    "http://bleacherreport.com/recruiting"
  end

  def path_247sports
    "http://247sports.com/Page/National-Signing-Day-Football-Recruiting-100134/Headlines#"
  end

end
