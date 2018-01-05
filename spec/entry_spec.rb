require 'spec_helper'

describe TimeCamp::Entry do
  describe ".get" do
    it "gets all entries" do
      VCR.use_cassette('entry/get_all') do
        from = '2016-10-01'
        to = '2017-10-01'
        entries = TimeCamp::Entry.get(from: from, to: to)
        expect(entries.class).to eq(TimeCamp::EntryCollection)
        expect(entries[0].class).to eq(TimeCamp::Entry)
      end
    end
  end

  describe ".timers" do
    it 'gets all timers' do
      VCR.use_cassette('entry/get_timers') do
        timers = TimeCamp::Entry.timers()
        expect(timers.class).to eq(TimeCamp::EntryCollection)
      end
    end
  end

end