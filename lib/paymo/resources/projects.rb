module Paymo
  class Projects

    def get_info(project_id)
      result = Paymo::API.get :projects, :get_info, project_id: project_id
      if result['status'] == 'ok'
        Paymo::Project.new(result['project'])
      end
    end

  end
end