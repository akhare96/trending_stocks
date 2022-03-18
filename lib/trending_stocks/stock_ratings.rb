class TrendingStocks::Stock_ratings
    
    attr_accessor :ratings

    def initialize(ratings)
        @ratings = ratings
    end

    def self.create_stock_ratings(selected_stock)
        analysts = TrendingStocks::Scraper.stock_analyst_scraper(selected_stock)
        selected_stock.ratings = analysts
    end

    def self.display_stock_ratings(user_stock)
        puts user_stock.ratings
    end

end