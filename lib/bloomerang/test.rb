# frozen_string_literal: true

require "faraday"
require "json"

module Bloomerang
  ## Bloomerang::Test
  # Use Faraday in test mode

  # TODO: how to get Base to defer to Test via
  # an initializer??
  class Test
    STUBS_PATH = File.join(__dir__, "../stubs").freeze
    CUSTOM_FIELD_TYPES = %w[Constituent Transaction Interaction Note Benevon].freeze
    PLURALS = %w[
      addresses
      appeals
      campaigns
      constituents
    ]

    def self.get(path, params = {})
      stubs.get(path) do |_env|
        [200, response_headers, response_body(path, "get")]
      end

      response = connection(params).get(path)

      puts response.env.url

      JSON.parse response.body
    end

    def self.delete(path, params = {})
      stubs.delete(path) do |_env|
        [200, response_headers, global_delete_body]
      response = connection(params).delete(path)

      puts response.env.url

      JSON.parse response.body
    end

    def self.post(path, params, body)
      response = connection(params).post(path, body.to_json)

      puts response.env.url

      JSON.parse response.body
    end

    def self.put(path, params, body)
      response = connection(params).put(path, body.to_json)

      puts response.env.url

      JSON.parse response.body
    end

    class << self
      private

      def connection(_params)
        Faraday.new do |builder|
          builder.adapter :test, stubs({})
        end
        # Faraday.new(
        #   Bloomerang.configuration.api_url,
        #   headers: {
        #     "Content-Type" => "application/json",
        #     "X-API-Key" => Bloomerang.configuration.api_key
        #   },
        #   params: params
        # )
      end

      def response_headers
        {
          "Date": Time.now.iso8610,
          "Content-Type": "application/json; charset=utf-8",
          "Content-Length": 1,
          "Connection": "keep-alive",
          "Cache-Control": "no-cache",
          "Pragma": "no-cache",
          "Expires": -1,
          "Server": "Microsoft-IIS/8.5",
          "X-AspNet-Version": "4.0.30319",
          "X-Powered-By": "ASP.NET",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Content-Type,Authorization",
          "Access-Control-Allow-Methods": "POST,GET,PUT,DELETE,HEAD,OPTIONS"
        }
      end

      # Look up a stub file using the path param
      def response_body(path, method)
        # TODO: HERE
        # TODO: gsub out CUSTOM_FIELD_TYPES,
        # case sensitive has no matches in existing paths

        # remove IDs, use underscores
        path.gsub(%r{/\d+}, "").gsub("/", "_")

        stub_file = "#{method}_#{path}"
        file = File.join(stubs_path, '../stubs')
      end
    end
  end
end
