require 'spec_helper'

describe Paymo::API do

  it 'returns a result when getting' do
    VCR.use_cassette('auth') do
      result = Paymo::API.post :sessions, username: ENV['PAYMO_EMAIL'], password: ENV['PAYMO_PASS']
      expect( result['sessions'][0]['id'] ).to be_a String
    end
  end

end
