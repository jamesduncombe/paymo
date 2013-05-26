require 'spec_helper'

describe Paymo::Extras do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    end
  end

  describe '#earnt_today?' do
    it 'returns how much I have earnt today' do
      VCR.use_cassette('extras.earnt_today') do
        @pe = Paymo::Extras.new
        @pe.earnt_today?.should be_an_instance_of Float
      end
    end
  end

end