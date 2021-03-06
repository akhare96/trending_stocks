class TrendingStocks::Stocks

    attr_accessor :ticker, :full_name, :ratings, :details, :news

    @@all = []

    def initialize(ticker, full_name)
        @ticker = ticker
        @full_name = full_name
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.create_stocks_list
        TrendingStocks::Scraper.trending_stocks_scraper
    end

    def self.display_stocks_list
        table = Terminal::Table.new {|t|
            self.all.each.with_index(1) {|stock, index|
                t << [index.to_s.colorize(:blue), stock.ticker, stock.full_name]
            }
            t.style = {:all_separators => true}
            t.title = "Top 25 trending stocks on Reddit".colorize(:blue)
        }
        puts table
    end

end