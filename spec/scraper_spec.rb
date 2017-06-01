describe "#scrape_scouts_newsfeed" do

  it "includes at least five projects" do
    scraper = Scraper.new
    scouts_url = "http://www.scout.com/college/football/recruiting/news?type=stories&sortBy=Date&site=ScoutFootball.com"
    expect(scraper.scrape_scouts_newsfeed(scouts_url).length).to be >= 1
  end

end
