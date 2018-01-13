require 'spec_helper'

describe TimeCamp::Task do
  describe '.get' do
    it 'gets tasks' do
      VCR.use_cassette('task/get') do
        tasks = TimeCamp::Task.get
        expect(tasks.class).to eq(TimeCamp::TaskCollection)
        expect(tasks[0].instance_variables).to include(:@task_id, :@parent_id, :@assigned_by, :@name, :@external_task_id, :@external_parent_id, :@level, :@archived, :@color, :@tags, :@budgeted, :@budget_unit, :@root_group_id, :@billable, :@note, :@public_hash, :@users, :@user_access_type)
      end
    end
  end

  describe '.create' do
    it 'creates a task' do
      VCR.use_cassette('task/create') do
        tasks = TimeCamp::Task.create(name: 'test')
        # TODO: ensure TaskCollections with only one item are returned as TimeCamp::Task
        # !!!! OR have all requests return *Collection  objects
        expect(tasks.class).to eq(TimeCamp::TaskCollection)
        expect(tasks.map(&:name)).to eq(['test'])
      end
    end
  end

  describe '.update' do
    it 'updates a task' do
      VCR.use_cassette('task/get') { @tasks = TimeCamp::Task.get }
      task_id = @tasks.select{|t| t.name == 'test'}[0].task_id
      VCR.use_cassette('task/update') do
        task = TimeCamp::Task.update(task_id: task_id, name: 'test2')
        expect(task.name).to eq('test2')
      end
    end
  end
end
