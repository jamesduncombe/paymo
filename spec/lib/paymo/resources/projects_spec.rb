require 'spec_helper'

describe Paymo::Projects do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    end
    @projects = Paymo::Projects.new
  end

  describe '#get_info' do
    it 'returns information about the project' do
      VCR.use_cassette('projects.get_info', record: :new_episodes) do
        result = @projects.get_info(802485)
        result.name.should be_a String
      end
    end
  end

end