require "CricApi/version"
require "CricApi/helper/request"

module CricApi
  
  def self.cricket
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).cricket
  end

  def self.matches
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).matches
  end
  
  def self.schedule
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).matchCalendar
  end
  
  def self.cricketScore(id)
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).cricketScore(id)
  end
  
  def self.playerStats(pid)
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).playerStats(pid)
  end
  
  def self.score(id)
    Cricket::Request.new('https://apecricket.herokuapp.com', 0).playerStats(id)
  end
  
end
