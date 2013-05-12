module Paymo
  class Entry

    attr_accessor :id, :added_manually, :billed, :start, :end, :description, :user_id, :user_name, 
                  :task_id, :task_name, :project_id, :project_name

    def initialize(result)
      @id             = result['id'].to_i
      @added_manually = !!result['added_manually']
      @billed         = !!result['billed']
      @start          = DateTime.parse(result['start']['_content'])
      @end            = DateTime.parse(result['end']['_content'])
      @description    = result['description']['_content']
      @user_id        = result['user']['id'].to_i
      @user_name      = result['user']['name']
      @task_id        = result['task']['id'].to_i
      @task_name      = result['task']['name']
      @project_id     = result['project']['id'].to_i
      @project_name   = result['project']['name']
    end

  end
end