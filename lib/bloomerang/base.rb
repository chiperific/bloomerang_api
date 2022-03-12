# frozen_string_literal: true

require "faraday"
require "json"

module Bloomerang
  class Base
    API_URL = "https://api.bloomerang.co/v2"
    API_KEY = ENV["BLOOMERANG_API_KEY"]

    # private

    def get(path, params = {})
      connection = Faraday.new(
        url: API_URL,
        headers: {
          "Content-Type" => "application/json",
          "X-API-Key" => API_KEY
        },
        params: params
      )

      response = connection.get(path)
      puts path
      JSON.parse response.body
    end

    def post(path, params, body)
      connection = Faraday.new(
        url: API_URL,
        headers: {
          "Content-Type" => "application/json",
          "X-API-Key" => API_KEY
        },
        params: params
      )

      response = connection.post(path, body.to_json)
      JSON.parse response.body
    end
  end
end
