require 'spec_helper'

describe TimeCamp::Entry do
  before do
    @from = '2016-01-01'
    @to = '2020-01-01'
  end

  describe ".get" do
    it "gets all entries" do
      VCR.use_cassette('entry/get_all') do
        entries = TimeCamp::Entry.get(from: @from, to: @to)
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

  describe ".create" do
    it 'creates an entry' do
      VCR.use_cassette('entry/create') do
        entry = TimeCamp::Entry.create(date: '2017-01-15', duration: 600)
        expect(entry.class).to eq(TimeCamp::Entry)
        expect(entry.entry_id.present?).to eq(true)
      end
    end
  end

  describe ".update" do
    before do
      VCR.use_cassette('entry/get_all') do
        @entries = TimeCamp::Entry.get(from: @from, to: @to)
        @last_entry = @entries[-1]
      end
    end

    it 'updates an entry' do
      VCR.use_cassette('entry/update') do
        original_start_time = DateTime.parse(@last_entry.start_time)
        original_end_time = DateTime.parse(@last_entry.end_time)
        @updated_start_time = (original_start_time + 1.hour).strftime('%H:%M:%S')
        @updated_end_time = (original_end_time + 1.hour).strftime('%H:%M:%S')

        entry = TimeCamp::Entry.update(id: @last_entry.id, start_time: @updated_start_time, end_time: @updated_end_time)
        expect(entry.class).to eq(TimeCamp::Entry)
      end

      VCR.use_cassette('entry/get_updated') do
        updated_entries = TimeCamp::Entry.get(from: @from, to: @to)
        updated_entry = updated_entries.find(@last_entry.id)
        expect(updated_entry.start_time).to eq(@updated_start_time)
        expect(updated_entry.end_time).to eq(@updated_end_time)
      end
    end
  end

  describe '.delete' do
    before do
      VCR.use_cassette('entry/get_all') do
        @entries = TimeCamp::Entry.get(from: @from, to: @to)
        @last_entry = @entries[-1]
      end
    end

    it 'deletes an entry' do
      VCR.use_cassette('entry/delete') do
        deleted_entry = TimeCamp::Entry.delete(id: @entries[1].id)
        expect(deleted_entry.class).to eq(TimeCamp::EntryCollection)
        expect(deleted_entry.size).to eq(0)
      end

      VCR.use_cassette('entry/get_after_deletion') do
        entries_after_deletion = TimeCamp::Entry.get(from: @from, to: @to)
        expect(entries_after_deletion.size).to eq(@entries.size - 1)
      end
    end
  end

end