# frozen_string_literal: true

module Bloomerang
  ## Bloomerang::Configuration
  class Configuration
    attr_accessor :api_key, :api_url

    def initialize
      @api_url = "https://api.bloomerang.co/v2"
      @api_key = nil
    end
  end
end
