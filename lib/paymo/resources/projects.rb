module Paymo
  class Projects

    def get_info(project_id)
      result = Paymo::API.get :projects, :get_info, project_id: project_id
      if result['status'] == 'ok'
        Paymo::Project.new(result['project'])
      end
    end

    def get_list(options = {})
      result = Paymo::API.get :projects, :get_list, options
      if result['status'] == 'ok'
        projects = []
        result['projects']['project'].each do |project|
          # p project
          projects << project
          # projects << Paymo::Project.new(project)
        end
        projects.select { |a| a['retired'] == 0 }.uniq{ |c| c['client']['id'] }.each { |p| puts p['client']['name']  }
      end
    end

  end
end
