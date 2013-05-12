require 'spec_helper'

describe Paymo::Projects do

  before(:all) do
    @paymo = Paymo::Base.new(username: 'james@jamesduncombe.com', password: '')
    @pr = Paymo::Projects.new
  end

  describe '#get_info' do
    it 'returns information about the project' do
      result = @pr.get_info(802485)
      result.name.should be_a String
    end
  end

end