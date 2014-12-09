require 'spec_helper'

describe Paymo do
  describe '#configure' do
    it 'hands API configuration to the gem' do
      Paymo.configure do |config|
        config.debug = false
      end
      expect( Paymo.config.debug ).to eql false
    end
  end

  describe '.auth' do
    it 'authenticates and gets a session id' do
      VCR.use_cassette('auth_2') do
        Paymo::Base.new(username: ENV['PAYMO_EMAIL'], password: ENV['PAYMO_PASS'])
        expect( Paymo.config.auth_token ).to be_a String
      end
    end
  end
end
