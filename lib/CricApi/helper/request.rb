require 'httparty'
require 'json'

module Cricket
  class Request
    include HTTParty
    base_uri 'https://apecricket.herokuapp.com'
    
    def initialize(service, page)
      @options = { query: {site: service, page: page} }
    end

    def cricket
      self.class.get("/api/cricket", @options)
    end

    def matches
      self.class.get("/api/matches", @options)
    end

    def matchCalendar
      self.class.get("/api/matchCalendar", @options)
    end

    def getNews
      self.class.get("/api/news", @options)
    end

    def cricketScore(id)
      self.class.post("/api/cricketScore",
      :body => {
        :unique_id => id
      }
      )
    end

    def playerStats(id)
      self.class.post("/api/playerStats",
      :body => {
        :pid => id
      }
      )
    end

    def ballByball(id)
      self.class.post("/api/ballByBall",
      :body => {
        :unique_id => id
      }
      )
    end

    def commentry(id)
      self.class.post("/api/commentry",
      :body => {
        :unique_id => id
      }
      )
    end

    def news(id)
      self.class.post("/api/news",
      :body => {
        :unique_id => id
      }
      )
    end

    def score(id)
      self.class.post("/api/score",
      :body => {
        :unique_id => id
      }
      )
    end

end
end
