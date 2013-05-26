require 'spec_helper'

describe Paymo::Projects do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    end
    @pr = Paymo::Reports.new
  end

  it 'returns a report' do
    start_time = Time.new(2013, 5, 1)
    end_time = Time.now
    clients = '374101'
    VCR.use_cassette('reports.create') do
      result = @pr.create(clients: clients, start: start_time, end: end_time, include_entries: '1')
      result['status'].should eq 'ok'
    end
  end

end