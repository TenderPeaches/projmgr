module Clients
    class Creator
        def initialize
        end

        def build(client_params = {})
            @client = Client.new(default_client_params(client_params))
        end

        def create(client_params = {})
            @client = Client.create(default_client_params(client_params))
        end

        private
        def default_client_params(client_params = {})
            {}.merge client_params
        end
    end
end
