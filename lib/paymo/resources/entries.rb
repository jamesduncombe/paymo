module Paymo
  class Entries
    
    # Get detailed information about an entry.
    def get_info(entry_id)
      Paymo::API.get :entries_getInfo, entry_id: entry_id
    end

    # Find entries for a specified user matching the optional time criteria.
    # options - start_date, end_date
    def find_by_user(user_id, options = {})
      options.merge!({user_id: user_id })
      Paymo::API.get :entries_findByUser, options
    end

    # Find entries for a specified task matching the optional time criteria.
    # options - start_date, end_date
    def find_by_task(task_id, options = {})
      options.merge!({task_id: task_id })
      Paymo::API.get :entries_findByTask, options
    end

    # Find entries for all tasks from the specified project matching the optional time criteria.
    # options - start_date, end_date
    def find_by_project(project_id, options = {})
      options.merge!({project_id: project_id })
      Paymo::API.get :entries_findByProject, options
    end

    # Returns the total amount of time tracked (in seconds) in all the entries for 
    # the given user matching the optional time criteria.
    # options - start_date, end_date
    def get_tracked_time_by_user(user_id, options = {})
      options.merge!({user_id: user_id })
      result = Paymo::API.get :entries_getTrackedTimeByUser, options
      { time: result['time']['_content'] }
    end

    # Returns the total amount of time tracked (in seconds) in all the entries for 
    # the given task matching the optional time criteria.
    # options - start_date, end_date
    def get_tracked_time_by_task(task_id, options = {})

    end

    # options - start_date, end_date
    def get_tracked_time_by_project(project_id, options = {})
    end


    # options - hash of added_manually (boolean), billed (boolean), description (string)
    def add(start_date, end_date, task_id, options = {})
    end

    # options - hash of billed (boolean) and description
    def add_bulk(date, duration, task_id, options = {})
    end
    
    # options - task_id, added_manually = true, billed = false, description
    def update(entry_id, start_date, end_date, options = {})
    end


    def delete(entry_id)
    end

  end
end