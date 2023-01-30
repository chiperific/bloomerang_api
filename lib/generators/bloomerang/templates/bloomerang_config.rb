# frozen_string_literal: true

require "bloomerang"

Bloomerang.configure do |config|
  ### Set your Bloomerang API key:
  # Generate your v2.0 API key from your Bloomerang user settings:
  # https://crm.bloomerang.co/Settings/User/Edit
  #
  # UNSECURE: DO NOT ADD THE KEY DIRECTLY TO THIS FILE!
  # It will be exposed in your source code.
  # Instead, use a secure method to store your API key
  #
  # Rails credentials example (preferred):
  # Learn about encrypted credentials: https://edgeguides.rubyonrails.org/security.html#custom-credentials
  # config.api_key = Rails.application.credentials.dig(:bloomerang, :api_key)
  #
  # ENV or dotenv example:
  # Learn about dotenv gem: https://github.com/bkeepers/dotenv
  # config.api_key = ENV["BLOOMERANG_API_KEY"]
  ### Other available settings:
  ## api_url: defaults to "https://api.bloomerang.co/v2"
  # config.api_url = "https://api.bloomerang.co/v2"
end
