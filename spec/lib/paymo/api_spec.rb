require 'spec_helper'

describe Paymo::API do

  it 'returns a result when getting' do
    puts Paymo::API.get :auth, :login, username: 'asdasd'
  end

  describe '#self.methodize' do
    it 'returns a camerlized string' do
      Paymo::API.methodize(:entries, :get_project).should eq 'entries.getProject'
    end
  end

end