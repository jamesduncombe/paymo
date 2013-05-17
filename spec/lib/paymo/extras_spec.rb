require 'spec_helper'

describe 'Paymo::Extras' do

  before(:all) do
    @paymo = Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    @pe = Paymo::Entries.new
    @pr = Paymo::Projects.new
  end

  describe '#how_much_have_i_earnt_today' do

    it 'should return how much I have earnt today' do

      @c = Cache.new(@pr, :price_per_hour)

      start_time = Time.new(2013, 5, 13)
      end_time = Time.new(2013, 5, 17, 23, 59)
      entries = @pe.find_by_user(9308, start: start_time, end: end_time)
     
      a = entries.map do |entry|
        {
          project_id: entry.project_id,
          hours: ((entry.end.to_time - entry.start.to_time) / 60 / 60)
        }
      end
     
      a.each do |entry|
        entry[:per_hour] = @c.get(entry[:project_id])
        entry[:total] = (entry[:per_hour] * entry[:hours])
      end

      sum = a.inject(0) { |sum, hash| sum + hash[:total] }

      puts sum

    end

  end
end