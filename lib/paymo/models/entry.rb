module Paymo
  class Entry < Base

    attr_accessor :id, :added_manually, :billed, :start_time, :end_time, :description,
                   :user_id, :task_id, :project_id, :duration, :created_on, :updated_on

    def initialize(result)
      @id             = result['id'].to_i
      @duration       = result['duration'].to_i
      @added_manually = result['added_manually']
      @billed         = result['billed']
      @description    = result['description']
      @user_id        = result['user_id'].to_i
      @task_id        = result['task_id'].to_i
      @project_id     = result['project_id'].to_i
      @start_time     = DateTime.parse(result['start_time'])
      @end_time       = DateTime.parse(result['end_time'])
      @created_on     = DateTime.parse(result['created_on'])
      @updated_on     = DateTime.parse(result['updated_on'])
      relationships(result)
    end

  end
end
