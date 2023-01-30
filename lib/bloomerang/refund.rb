# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Refund
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds
  # Id            integer($int64), The ID of the refund
  # TransactionId integer($int64), The ID of the transaction used in the API (not to be confused with transactionNumber)
  # Note          string, The reason for making this refund
  # Date          string($date), iso8601 format
  # Amount        number($currency)
  # AuditTrail    AuditTrail  (object)
  class Refund < Base
    ### Fetch all refunds
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds/get_refunds
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # transactionId   array[integer], separated by pipes: "1|2|3", Filters results based on the transaction ID for the refund.
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def self.fetch(params = {})
      get("refunds", params)
    end

    ### Create a refund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds/post_refund
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("refund", {}, body)
    end

    ### Fetch a refund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds/get_refund__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("refund/#{id}")
    end

    ### Update a refund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds/put_refund__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("refund/#{id}", {}, body)
    end

    ### Delete a refund
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Refunds/delete_refund__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("refund/#{id}")
    end
  end
end
