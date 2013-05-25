require 'spec_helper'

describe Paymo::Projects do

  before(:all) do
    @paymo = Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    @pr = Paymo::Reports.new
  end

  it 'returns a report' do
    start_time = Time.new(2013, 5, 1)
    end_time = Time.now
    clients = '374101'
    p @pr.create(clients: clients, start: start_time, end: end_time, include_entries: '1')
  end

end