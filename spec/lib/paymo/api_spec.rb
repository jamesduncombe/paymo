require 'spec_helper'

describe Paymo::API do

  it 'returns a result when getting' do
    VCR.use_cassette('auth') do
      result = Paymo::API.post :auth, :login, username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS']
      result['status'].should eq 'ok'
    end
  end

  describe '#self.methodize' do
    it 'returns a camerlized string' do
      Paymo::API.methodize(:entries, :get_project).should eq 'entries.getProject'
    end
  end

end
