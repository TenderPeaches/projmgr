module ProjectsHelper
    def project_list(projects)
        render("projects/table", projects: projects)
    end
end
