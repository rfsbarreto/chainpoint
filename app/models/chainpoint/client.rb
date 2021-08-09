require 'faraday_middleware'

module Chainpoint
  class Client
    BASE_URL = 'http://18.191.50.129'

    class << self
      def submit(hash)
        params = { hashes: [hash] }

        response = faraday_connection.post('/hashes') do |req|
          req.body = params
        end

        response.body if response.success?
      end

      private

      def faraday_connection
        headers =
          { 'Content-Type' => 'application/json' }
        Faraday.new(url: BASE_URL, headers: headers) do |f|
          f.request :json
          f.response :json
        end
      end
    end
  end
end
