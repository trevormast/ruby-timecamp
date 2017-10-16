module TimeCamp
  class Task < TimeCamp::Resource
    attr_reader :task_id, :parent_id, :assigned_by, :name, :external_task_id,
                :external_parent_id, :level, :archived, :color, :tags, :budgeted,
                :budget_unit, :root_group_id, :billable, :note, :public_hash, :users,
                :user_access_type

    def initialize(response)
      response.each { |k,v| instance_variable_set("@#{k.underscore}", v) }
    end

    def self.get(opts={})
      response = TimeCamp::Request.get(resource_name, opts)
      return TaskCollection.parse(response)
    end
  end
end