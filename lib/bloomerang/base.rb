# frozen_string_literal: true

require "faraday"
require "json"

module Bloomerang
  ## Bloomerang::Base
  # Primary interface for Faraday
  class Base
    def self.get(path, params = {})
      response = connection(params).get(path)
      JSON.parse response.body
    end

    def self.delete(path, params = {})
      response = connection(params).delete(path)
      JSON.parse response.body
    end

    def self.post(path, params, body)
      response = connection(params).post(path, body.to_json)
      JSON.parse response.body
    end

    def self.put(path, params, body)
      response = connection(params).put(path, body.to_json)
      JSON.parse response.body
    end

    class << self
      private

      def connection(params)
        Faraday.new(
          url: Bloomerang.configuration.api_url,
          headers: {
            "Content-Type" => "application/json",
            "X-API-Key" => Bloomerang.configuration.api_key
          },
          params: params
        )
      end
    end
  end
end
