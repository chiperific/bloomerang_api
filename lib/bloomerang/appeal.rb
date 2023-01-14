# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Appeal
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Appeals
  # Id        integer($int64)
  # Name      string
  # SortIndex integer($int32)
  # IsActive  boolean
  class Appeal < Base
    ### Fetch all appeals
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Appeals/get_appeals
    #
    # Params:
    # skip        integer, default: 0,  simple paging system
    # take        integer, default: 50, simple paging system
    # id          array[integer], separated by pipes: "1|2|3"
    # isActive    boolean, Filters to either active or inactive appeals
    # search      string, Filters to appeals with names that match any part of the search string
    def all
      get("appeals", params)
    end

    ### Show an appeal
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Appeals/get_appeal__id_
    #
    # Params:
    # id  integer
    def show(id)
      get("appeal/#{id}")
    end

    ### Create an appeal
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Appeals/post_appeal
    #
    # Params:
    # body  see API for fields
    def create(body)
      post("appeal", {}, body)
    end

    ### Update an appeal
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Appeals/put_appeal__id_
    #
    # Params:
    # id    integer
    # body  see API for fields
    def update(id, body)
      put("appeal/#{id}", {}, body)
    end
  end
end
