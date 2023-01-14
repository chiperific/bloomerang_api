# frozen_string_literal: true

require "faraday"
require "json"

module Bloomerang
  ## Bloomerang::Base
  # Primary interface for Faraday #get, #post, #put
  #
  # TODO: DECIDE should body.to_json be removed
  # and instead expect body to already be JSON?
  # or use in-memory Models instead of JSON?
  #
  # TODO: DECIDE should the class raise errors if
  # path, params and body are blank/nil/bad?
  class Base
    API_URL = "https://api.bloomerang.co/v2"
    API_KEY = ENV["BLOOMERANG_API_KEY"]

    def get(path, params = {})
      response = connection(params).get(path)
      JSON.parse response.body
    end

    def delete(path, params = {})
      response = connection(params).delete(path)
      JSON.parse response.body
    end

    def post(path, params, body)
      response = connection(params).post(path, body.to_json)
      JSON.parse response.body
    end

    def put(path, params, body)
      response = connection(params).put(path, body.to_json)
      JSON.parse response.body
    end

    private

    def connection(params)
      Faraday.new(
        url: API_URL,
        headers: {
          "Content-Type" => "application/json",
          "X-API-Key" => API_KEY
        },
        params: params
      )
    end
  end
end
