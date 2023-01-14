# frozen_string_literal: true

require_relative "bloomerang/version"
require_relative "bloomerang/base"
require_relative "bloomerang/constituent"
require_relative "bloomerang/transaction"
require_relative "bloomerang/fund"
require_relative "bloomerang/campaign"
require_relative "bloomerang/address"
require_relative "bloomerang/appeal"

module Bloomerang
  class Error < StandardError; end
end
