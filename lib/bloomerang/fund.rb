# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Fund
  # Id                          integer($int64)
  # GeneralLedgerClass          string, The class label for this fund in the general ledger (quickbooks)
  # DefaultQuickbooksAccountId  integer($int64), The ID of the general ledger (quickbooks) account to which this fund will default
  # QuickbooksAccountIds        array[integer], The IDs of all general ledger (quickbooks) accounts associated with this fund
  # SortIndex                   integer($int32)
  # Name                        string
  # IsDefault                   boolean
  # IsActive                    boolean
  class Fund < Base
    ### Fetch all funds
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Funds/get_funds
    #
    # Params:
    # skip          integer, default: 0,  simple paging system
    # take          integer, default: 50, simple paging system
    # id            array[integer], separated by pipes: "1|2|3"
    # isActive      boolean
    # search        string, Filters to funds with names that match any part of the search string
    def fetch(params = {})
      get("funds", params)
    end

    ### Fetch fund by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Funds/get_fund__id_
    #
    # Params:
    # id  integer
    def get(id)
      get("fund/#{id}")
    end

    ### Create fund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Funds/post_fund
    #
    # Params:
    # body  JSON object, see API for fields
    def create(body)
      post("fund", {}, body)
    end

    ### Update a fund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Funds/put_fund__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def update(id, body)
      put("fund/#{id}", {}, body)
    end
  end
end
