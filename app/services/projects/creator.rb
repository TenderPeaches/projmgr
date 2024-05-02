module Projects
    class Creator
        def initialize
        end

        def build(project_params = {})
            @project = Project.new(default_project_params(project_params))
        end

        def create(project_params = {})
            @project = Project.create(default_project_params(project_params))
        end

        private
        def default_project_params(project_params = {})
            {active: true}.merge(project_params)
        end
    end
end
