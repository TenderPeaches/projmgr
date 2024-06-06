class ClientsController < ApplicationController

    def index
        @clients = Client.all                 # list of all active projects
    end

    def show
        set_client
    end

    def new
        @client = Clients::Creator.new.build
        set_form_name
    end

    def edit
        set_client
    end

    def create
        @client = Clients::Creator.new.create(client_params)
    end

    def update
        set_client
        @client.update(client_params)
    end

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
