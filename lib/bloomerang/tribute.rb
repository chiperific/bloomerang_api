# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Tribute
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes
  # Id                    integer($int64)
  # SortIndex             integer($int32)
  # Note                  string
  # TributeType           TributeType, string, Enum: [ InHonorOf, InMemoryOf ]
  # NotificantAccountIds  array[integer], The IDs of all notificants (constituents) associated with this tribute
  # Name                  string
  # IsDefault             boolean, Is this the default?
  # IsActive              boolean, Is this active?
  class Tribute < Base
    ### Fetch all tributes
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes/get_tributes
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # id              array[integer], separated by pipes: "1|2|3", Filters to tributes with the IDs in the list (pipe-separated)
    # isActive        boolean
    def self.fetch(params = {})
      get("tributes", params)
    end

    ### Create a tribute
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes/post_tribute
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("tribute", {}, body)
    end

    ### Fetch tribute by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes/get_tribute__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("tribute/#{id}")
    end

    ### Update tribute
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes/put_tribute__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("tribute/#{id}", {}, body)
    end

    ### Search for active tributes
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tributes/get_tributes_search
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # search          string, The text to search (must be at least 3 characters)
    def self.search_active(params = {})
      get("tributes/search", params)
    end
  end
end
