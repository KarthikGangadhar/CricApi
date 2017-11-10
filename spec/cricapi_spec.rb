require 'spec_helper'

describe CricApi do
 
  describe '#cricket' do
    
    it 'returns data' do
      output = CricApi::cricket
      expect(output).not_to be(nil)
    end

  end
end