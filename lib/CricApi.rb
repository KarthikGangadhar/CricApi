require "CricApi/version"
require "hashie"
require "httparty"

module CricApi
  class Request
  include HTTParty
  base_uri 'http://cricapi.com'
  
  def initialize(key)
    @options = { query: {site: "cricapi.com", apikey: key }  }
  end
  
  def cricket
    response = self.class.get("/api/cricket", @options)
    cricket = clean_response(response)
    cricket
  end

  def matches
    response = self.class.get("/api/matches", @options)
    matches = clean_response(response)
    matches    
  end
  
  def schedule
    response = self.class.get("/api/matchCalendar", @options)
    schedule = clean_response(response)
    schedule
  end
  
  def cricketScore(id)
    @options[:query][:unique_id] = id
    response = self.class.post("/api/cricketScore", @options)
    cricketScore = clean_response(response)
    cricketScore
  end
  
  def playerStats(pid)
    @options[:query][:pid] = pid
    response = self.class.post("/api/playerStats", @options)
    playerStats = clean_response(response)
    playerStats
  end
  
  def fantasySummary(unique_id)
    @options[:query][:unique_id] = unique_id
    response = self.class.post("/api/fantasySummary", @options)
    summary = clean_response(response)
    summary
  end

  def fantasySquad(unique_id)	
    @options[:query][:unique_id] = unique_id	
    response = self.class.post("/api/fantasySquad", @options)	
    squad = clean_response(response)	
    squad	
  end

  def playerFinder(name)
    @options[:query][:name] = name
    response = self.class.post("/api/playerFinder", @options)
    player = clean_response(response)
    player
  end   
  
  private
  
  def clean_response(response)
    response_not_present = (response.empty? && response.nil? && response.parsed_response.empty? && response.parsed_response.nil?)
    response_not_present ? Hashie::Mash.new({ :error => "No data"}) : Hashie::Mash.new( response.parsed_response )
  end
  
end
end
