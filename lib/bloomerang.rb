# frozen_string_literal: true

require_relative "bloomerang/version"
require_relative "bloomerang/base"
require_relative "bloomerang/configuration"

require_relative "bloomerang/address"
require_relative "bloomerang/appeal"
require_relative "bloomerang/campaign"
require_relative "bloomerang/constituent"
require_relative "bloomerang/custom_field"
require_relative "bloomerang/email"
require_relative "bloomerang/email_interest"
require_relative "bloomerang/fund"
require_relative "bloomerang/household"
require_relative "bloomerang/interaction"
require_relative "bloomerang/note"
require_relative "bloomerang/phone"
require_relative "bloomerang/pledge"
# require_relative "bloomerang/processor"
require_relative "bloomerang/refund"
require_relative "bloomerang/relationship"
require_relative "bloomerang/soft_credit"
require_relative "bloomerang/task"
require_relative "bloomerang/transaction"
require_relative "bloomerang/tribute"
# require_relative "bloomerang/user"
# require_relative "bloomerang/wallet_item"

module Bloomerang
  class Error < StandardError; end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(&block)
    yield(configuration)
  end
end
