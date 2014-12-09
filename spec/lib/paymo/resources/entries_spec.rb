require 'spec_helper'

describe Paymo::Entries do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: ENV['PAYMO_EMAIL'], password: ENV['PAYMO_PASS'])
    end
    @pe = Paymo::Entries.new
  end

  describe '#all' do
    it 'gets all the results' do
      VCR.use_cassette('entries.all', record: :new_episodes) do
        expect( @pe.all ).to be_a Array
      end
    end
  end

  describe '#find' do
    it 'gets all the results' do
      VCR.use_cassette('entries.find', record: :new_episodes) do
        expect( @pe.find(11892813) ).to be_an_instance_of Paymo::Entry
      end
    end
  end

end
