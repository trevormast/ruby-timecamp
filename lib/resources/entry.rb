module TimeCamp
  class Entry < TimeCamp::Resource
    attr_reader :id, :duration, :user_id, :description, :last_modify,
                :billable, :task_id, :date, :start_time, :name, :addons_external_id,
                :invoice_id, :started_at, :entry_id, :note

    def initialize(response)
      response.each { |k,v| instance_variable_set("@#{k.underscore}", v) }
    end

    # Example GET response
    # [
    #   {
    #     "id":"3621",
    #     "duration":"3600", // in seconds
    #     "user_id":"123",
    #     "description":"",
    #     "last_modify":"2014-03-19 14:34:50",
    #     "billable":1,
    #     "task_id":"3132",
    #     "date":"2013-03-30",
    #     "start_time":"12:20:00", // this value may be null if user did not specify time frame
    #     "name":"Task name",
    #     "addons_external_id":"123241", // for integrations with Trello, Pivotal Tracker, etc., "0" if no integration
    #     "billable":0/1,
    #     "invoiceId":0/invoiceId
    #   }
    # ]
    # required :from, :to
    # optional :task_ids, :with_subtasks, :user_ids
    def self.get(opts={})
        response = TimeCamp::Request.get(resource_name, opts)
        return EntryCollection.parse(response)
    end

    def self.timers(opts={})
      response = TimeCamp::Request.get('timer_running', opts)
      return EntryCollection.parse(response)
    end

    # required :date(%Y-%m-%d), :duration(in seconds)
    # optional :note, :start_time(13:30:00), :end_time, :billable, :task_id
    def self.create(opts={})
      data_keys = [:date, :duration, :note, :start_time, :end_time, :billable, :task_id]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      response = TimeCamp::Request.post(resource_name, opts, data)
      return EntryCollection.parse(response)
    end

    # required :id
    # optional :duration, :note, :start_time, :end_time, :billable, :invoiceId, :task_id, :updateActivities
    def self.update(opts={})
      data_keys = [:id, :duration, :note, :start_time, :end_time, :billable, :invoiceId, :task_id, :updateActivities]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      response = TimeCamp::Request.put(resource_name, opts, data)
      return EntryCollection.parse(response)
    end

    def self.delete(opts={})
      data_keys = [:id, :entry_id]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      response = TimeCamp::Request.delete(resource_name, opts, data)
      return EntryCollection.parse(response)
    end

  end
end