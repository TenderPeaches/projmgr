class ProjectsController < ApplicationController

    # GET /projects
    def index
        @projects = Project.active                 # list of all active projects
    end

    # GET /projects/1
    def show
        set_project
    end

    # GET /projects/new
    def new
        @project = Projects::Creator.new.build
    end

    # GET /projects/1/edit
    def edit
        set_project
    end

    # POST /projects or /projects.json
    def create
        @project = Projects::Creator.new.create(project_params)
    end

    # PATCH/PUT /projects/1 or /projects/1.json
    def update
        set_project
        @project.update(project_params)
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
        set_project
        @project.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_project
            @project = Project.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def project_params
            params.require(:project).permit(:name, :active, :client, :client_id, client_attributes: [ :company_name, contact_attributes: [ :first_name, :last_name, :email, :phone, :notes ]])
        end
end
