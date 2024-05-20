module ProjectsHelper
    def project_data(project)
        render "shared/data", data: [
            { label: "Hrs worked", value: project.hours_worked },
            { label: "Hrs billed", value: project.hours_billed },
            { label: "Pending pay", value: number_to_currency(project.pending_pay, precision: 2) },
            { label: "Total pay", value: number_to_currency(project.total_pay, precision: 2) }, ]
    end
end
