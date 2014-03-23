require 'spec_helper'

describe Paymo::Extras do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    end
  end

  describe '#earnt_today?' do
    it 'returns how much a user has earnt today' do
      VCR.use_cassette('extras.earnt_today', record: :new_episodes) do
        Paymo::Extras.new(9308).earnt_today?.should be_an_instance_of Float
      end
    end
  end

  describe '#earnt_this_month?' do
    it 'returns how much a user has earnt this month' do
      VCR.use_cassette('extras.earnt_this_month', record: :new_episodes) do
        Paymo::Extras.new(9308).earnt_this_month?.should be_an_instance_of Float
      end
    end
  end

  describe '#earnt_this_week?' do
    it 'returns how much a user has earnt this week' do
      VCR.use_cassette('extras.earnt_this_week', record: :new_episodes) do
        Paymo::Extras.new(9308).earnt_this_week?.should be_an_instance_of Float
      end
    end
  end

end
