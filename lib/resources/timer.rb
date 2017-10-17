module TimeCamp
  class Timer < TimeCamp::Resource
    attr_reader :new_timer_id, :entry_id, :isTimerRunning, :elapsed, :timer_id,
                :start_time, :task_id, :name, :external_task_id, :entry_time

    def initialize(response)
      response.each { |k,v| instance_variable_set("@#{k.underscore}", v) }
    end

    def self.resource_name
      return 'timer'
    end

    def self.get
      response = TimeCamp::Request.post(resource_name, {}, { action: 'status' })
      return Timer.new(response)
    end

    # optional :task_id, :entry_id, :started_at
    def self.start(opts={})
      data_keys = [:task_id, :entry_id, :started_at]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      data.merge!(action: 'start')
      response = TimeCamp::Request.post(resource_name, opts, data)
      return Timer.new(response)
    end

    # required :timer_id, :stopped_at
    def self.stop(opts={})
      data_keys = [:timer_id, :stopped_at]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      data.merge!(action: 'stop')
      response = TimeCamp::Request.post(resource_name, opts, data)
      return Timer.new(response)
    end
  end
end