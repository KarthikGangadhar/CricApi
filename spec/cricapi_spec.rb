require 'spec_helper'

describe CricApi do
 
  before(:all) do
    @output = CricApi::Request.new("yiPB2mqlqdNnPa57Vs8P8S74DXk1")
    @data = @output.cricket.data
  end
  
  describe '#cricket' do
    it 'returns on-going cricket data' do
      cricket = @output.cricket
      expect(cricket.data.length).to be > 0
    end

  end 
  
  describe '#schedule' do
    it 'returns schedule data' do
      schedule = @output.schedule
      expect(schedule.data.length).to be > 0
    end

  end
  
  describe '#matches' do
    it 'returns match data' do
      matches = @output.matches
      expect(matches.matches.length).to be > 0
    end

  end

  describe '#cricketScore' do
    it 'returns team score data' do
      cricketScore = @output.cricketScore(@data[0].unique_id)
      expect(cricketScore.score).not_to be(nil)
    end

  end  

  describe '#playerStats' do
    it 'returns playerStats data' do
      playerStats = @output.playerStats("35320")
      expect(playerStats.pid.to_s).to eq("35320")
    end

  end  
  
end