module TimeCamp
  class Task < TimeCamp::Resource
    attr_reader :task_id, :parent_id, :assigned_by, :name, :external_task_id,
                :external_parent_id, :level, :archived, :color, :tags, :budgeted,
                :budget_unit, :root_group_id, :billable, :note, :public_hash, :users,
                :user_access_type

    #################
    # CLASS METHODS #
    #################

    # optional :task_id
    def self.get(opts={})
      response = TimeCamp::Request.get(resource_name, opts)
      return TaskCollection.parse(response)
    end

    # required :name
    # optional :tags, :parent_id, :external_task_id, :external_parent_id,
    #          :budgeted, :note, :archived, :billable, :budget_unit,
    #          :user_ids (comma separated), :role
    def self.create(opts={})
      data_keys = [:name, :tags, :parent_id, :external_task_id, :external_parent_id, :budgeted, :note, :archived, :billable, :budget_unit, :user_ids, :role]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      response = TimeCamp::Request.post(resource_name, opts, data)
      return TaskCollection.parse(response)
    end

    # required :task_id
    # optional :name, :tags, :parent_id, :external_task_id,
    #          :external_parent_id, :budgeted, :note, :archived,
    #          :billable, :budget_unit, :user_ids (comma separated), :role
    def self.update(opts={})
      data_keys = [:task_id, :name, :tags, :parent_id, :external_task_id, :external_parent_id, :budgeted, :note, :archived, :billable, :budget_unit, :user_ids, :role]
      data, opts = opts.partition{ |k, v| data_keys.include?(k) }.map(&:to_h)
      response = TimeCamp::Request.put(resource_name, opts, data)
      return TaskCollection.parse(response)
    end

    ####################
    # INSTANCE METHODS #
    ####################

    private
      def load_attributes(response)
        @task_id = response[:task_id]
        @parent_id = response[:parent_id]
        @assigned_by = response[:assigned_by]
        @name = response[:name]
        @external_task_id = response[:external_task_id]
        @external_parent_id = response[:external_parent_id]
        @level = response[:level]
        @archived = response[:archived]
        @color = response[:color]
        @tags = response[:tags]
        @budgeted = response[:budgeted]
        @budget_unit = response[:budget_unit]
        @root_group_id = response[:root_group_id]
        @billable = response[:billable]
        @note = response[:note]
        @public_hash = response[:public_hash]
        @users = response[:users]
        @user_access_type = response[:user_access_type]
      end
  end
end