require 'spec_helper'

describe TimeCamp::Timer do
  describe '.start' do
    it 'starts a timer' do
      VCR.use_cassette('timer/start') do
        timer = TimeCamp::Timer.start
        expect(timer.class).to eq(TimeCamp::Timer)
        expect(timer.instance_variables).to include(:@new_timer_id, :@entry_id)
      end
    end
  end

  describe '.get' do
    it 'gets timers' do
      VCR.use_cassette('timer/get') do
        timers = TimeCamp::Timer.get
        expect(timers.class).to eq(TimeCamp::Timer)
        expect(timers.instance_variables).to include(:@entry_id, :@is_timer_running, :@elapsed, :@timer_id, :@start_time)
      end
    end
  end

  describe '.stop' do
    it 'stops a timer' do
      VCR.use_cassette('timer/get') { @timer = TimeCamp::Timer.get }

      VCR.use_cassette('timer/stop') do
        timers = TimeCamp::Timer.stop(timer_id: @timer.timer_id, stopped_at: DateTime.now.strftime('%Y-%m-%d %H:%M:%S'))
        expect(timers.class).to eq(TimeCamp::Timer)
        expect(timers.instance_variables).to include(:@entry_id, :@elapsed, :@entry_time)
        expect(timers.elapsed).to eq(91)
      end
    end
  end

  # TODO: get without running timer, get with multiple running timers
end