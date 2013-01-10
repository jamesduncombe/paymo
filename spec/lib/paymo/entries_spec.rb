require 'spec_helper'

describe Paymo::Entries do

  it 'creates instance' do
    @p = Paymo::Entries.new
    @p.get_info.should eq 'blah'
  end

  describe '#find_by_user' do
    it 'finds a user' do
      @p = Paymo::Entries.new
      @p.find_by_user
    end
  end
  
end