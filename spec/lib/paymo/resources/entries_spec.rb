require 'spec_helper'

describe Paymo::Entries do

  before(:all) do
    @paymo = Paymo::Base.new(username: 'james@jamesduncombe.com', password: ENV['PAYMO_PASS'])
    @pe = Paymo::Entries.new
  end

  describe '#get_info' do
    it 'gets user info' do      
      result = @pe.get_info(10706552)
      result.project_name.should eq 'IndieArtery'
    end
  end

  describe '#find_by_user' do
    it 'finds a user' do
      puts @pe.find_by_user(9308)
    end
    context 'with a start and end date supplied' do
      it 'returns just projects worked on in that time frame' do
        start_time = Time.new(2013, 5, 7)
        end_time = Time.new(2013, 5, 7, 23, 59)
        entries = @pe.find_by_user(9308, start: start_time, end: end_time)
        entries.first.project_name.should eq 'Work'
      end
    end
  end

  describe '#find_by_task' do
    it 'finds a task' do
      puts @pe.find_by_task(1604790)
    end
  end

  describe '#find_by_project' do
    it 'finds a project' do
      result = @pe.find_by_project(337047)
      result.first.description.should eq 'Replying to email re members @ 92.'
    end
  end

  describe '#get_tracked_time_by_user' do
    context 'with no options supplied' do
      it 'finds all tracked time by user' do
        @pe.get_tracked_time_by_user(9308)[:time].should be_a Fixnum
      end
    end

    context 'with a start and end date supplied' do
      it 'returns the correct' do
        start_time = Time.new(2013, 5, 8)
        end_time = Time.new(2013, 5, 8, 23, 59)
        @pe.get_tracked_time_by_user(9308, start: start_time, end: end_time )[:time].should be_a Fixnum
      end
    end
  end

  describe '#get_tracked_time_by_task' do
    it 'finds all tracked time by task' do
      @pe.get_tracked_time_by_task(1604790)[:time].should be_a Fixnum
    end
  end

  describe '#get_tracked_time_by_project' do
    it 'finds all tracked time by project' do
      @pe.get_tracked_time_by_project(337047)[:time].should be_a Fixnum
    end
  end

  
end