require 'spec_helper'

describe Paymo::Entries do

  before(:all) do
    VCR.use_cassette('auth') do
      Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    end
    @pe = Paymo::Entries.new
  end

  describe '#get_info' do
    it 'gets user info' do
      VCR.use_cassette('entries.get_info', record: :new_episodes) do
        result = @pe.get_info(10706552)
        result.project_name.should eq 'IndieArtery'
      end
    end
  end

  describe '#find_by_user' do
    it 'finds a user' do
      VCR.use_cassette('entries.find_by_user', record: :new_episodes) do
        @pe.find_by_user(9308).first.should be_an_instance_of Paymo::Entry
      end
    end
    context 'with a start and end date supplied' do
      it 'returns just projects worked on in that time frame' do
        start_time = Time.new(2013, 5, 7)
        end_time = Time.new(2013, 5, 7, 23, 59)
        VCR.use_cassette('entries.get_info.with_start_end', record: :new_episodes) do
          entries = @pe.find_by_user(9308, start: start_time, end: end_time)
          entries.first.project_name.should eq 'Work'
        end
      end
    end
  end

  describe '#find_by_task' do
    it 'finds a task' do
      VCR.use_cassette('entries.find_by_task', record: :new_episodes) do
        @pe.find_by_task(1604790)['status'].should eql 'ok'
      end
    end
  end

  describe '#find_by_project' do
    it 'finds a project' do
      VCR.use_cassette('entries.find_by_project', record: :new_episodes) do
        result = @pe.find_by_project(337047)
        result.first.description.should eq 'Replying to email re members @ 92.'
      end
    end
  end

  describe '#get_tracked_time_by_user' do
    context 'with no options supplied' do
      it 'finds all tracked time by user' do
        VCR.use_cassette('entries.get_tracked_time_by_user', record: :new_episodes) do
          @pe.get_tracked_time_by_user(9308)[:time].should be_a Fixnum
        end
      end
    end

    context 'with a start and end date supplied' do
      it 'returns the correct' do
        start_time = Time.new(2013, 5, 8)
        end_time = Time.new(2013, 5, 8, 23, 59)
        VCR.use_cassette('entries.get_tracked_time_by_user.with_start_end', record: :new_episodes) do
          @pe.get_tracked_time_by_user(9308, start: start_time, end: end_time )[:time].should be_a Fixnum
        end
      end
    end
  end

  describe '#get_tracked_time_by_task' do
    it 'finds all tracked time by task' do
      VCR.use_cassette('entries.get_tracked_time_by_task', record: :new_episodes) do
        @pe.get_tracked_time_by_task(1604790)[:time].should be_a Fixnum
      end
    end
  end

  describe '#get_tracked_time_by_project' do
    it 'finds all tracked time by project' do
      VCR.use_cassette('entries.get_tracked_time_by_project', record: :new_episodes) do
        @pe.get_tracked_time_by_project(337047)[:time].should be_a Fixnum
      end
    end
  end

end