class ClientsController < ApplicationController

    # GET /projects
    def index
        @client = Client.all                 # list of all active projects
    end

    # GET /projects/1
    def show
        set_client
    end

    # GET /projects/new
    def new
        @client = Clients::Creator.new.build
    end

    # GET /projects/1/edit
    def edit
        set_client
    end

    # POST /projects or /projects.json
    def create
        @client = Clients::Creator.new.create(client_params)
    end

    # PATCH/PUT /projects/1 or /projects/1.json
    def update
        set_client
        @client.update(client_params)
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
        set_client
        @client.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_client
            @client = Client.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def client_params
            params.require(:client).permit(:company_name)
        end
end
