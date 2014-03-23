require 'spec_helper'

describe Paymo do
  describe '#configure' do
    it 'hands API configuration to the gem' do
      Paymo.configure do |config|
        config.api_key = ENV['PAYMO_API_KEY']
      end
      Paymo.config.api_key.should be_a String
    end
  end
end
