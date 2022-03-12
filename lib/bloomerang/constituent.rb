# frozen_string_literal: true

require_relative "base"

module Bloomerang
  class Constituent < Base
    def all
      get("constituents")
    end

    def show(id)
      get("constituent/#{id}")
    end

    def search(query)
      get("constituents/search", search: query)
    end

    # Creates a new Constituent. In most cases, the method "merge" may be more useful.
    def create(body)
      post("constituent", {}, body)
    end

    # Although called merge by Bloomerang, this is more of a specialized upsert.
    # From the documentation:

    # "When merging, the database will look for a possible duplicate defined as a
    # name plus one piece of contact info (address, email, or phone). If a duplicate
    # is found, the data passed in will be merged into an existing constituent.
    # If no duplicate is found, a new constituent will be created. Note that
    # this endpoint does not accept SecondaryAddresses, SecondaryEmails, or
    # SecondaryPhones and you will receive an exception if you pass those in.""
    def merge(body)
      post("constituent/merge", {}, body)
    end
  end
end
