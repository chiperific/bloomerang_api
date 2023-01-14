# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Address
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses
  # Id                integer($int64)
  # AccountId         integer($int64) The ID of the constituent used in the API (not to be confused with accountNumber)
  # Type              AddressType Enum: [ Home, Vacation, Work ]
  # Street            string
  # City              string
  # State             string Must match a state in the Bloomerang CRM
  # PostalCode        string
  # Country           string Must match a country in the Bloomerang CRM
  # IsPrimary         boolean
  # IsBad             boolean
  # StateAbbreviation string The 2-3 letter abbreviation for the state/province
  # CountryCode       string The 2 letter ISO code for the country
  class Address < Base
    ### Fetch all addresses
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses/get_addresses
    #
    ## Params:
    # skip        integer, default: 0,  simple paging system
    # take        integer, default: 50, simple paging system
    # constituent array[integer], separated by pipes: "1|2|3"
    # id          array[integer], separated by pipes: "1|2|3"
    def all(params = {})
      get("addresses", params)
    end

    ### Show an address
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses/get_address__id_
    #
    ## Params:
    # id integer
    def show(id)
      get("addresses/#{id}")
    end

    ### Create an address
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses/post_address
    #
    # Params:
    # body  see API for fields
    def create(body)
      post("address", {}, body)
    end

    ### Update an address
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses/put_address__id_
    #
    # Params:
    # id    integer
    # body  see API for fields
    def update(id, body)
      put("address/#{id}", {}, body)
    end

    ### Delete an address
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Addresses/delete_address__id_
    #
    # Params:
    # id   integer
    def delete(id)
      delete("address/#{id}", {})
    end
  end
end
