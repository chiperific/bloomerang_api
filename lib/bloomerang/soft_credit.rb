# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::SoftCredit
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits
  # Id            integer($int64), The ID of the soft credit
  # DesignationId integer($int64), The ID of the designation used in the API (not to be confused with designationNumber)
  # TransactionId integer($int64), The ID of the transaction used in the API (not to be confused with transactionNumber)
  # Amount        number($currency)
  # AccountId     integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # AuditTrail    AuditTrail (object)
  class SoftCredit < Base
    ### Fetch all soft credits
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits/get_softcredits
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # constituent     array[integer], separated by pipes: "1|2|3"
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def self.fetch(params = {})
      get("softcredits", params)
    end

    ### Create a soft credit
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits/post_softcredit
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("softcredit", {}, body)
    end

    ### Fetch a soft credit by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits/get_softcredit__id_
    #
    # Params
    # id  integer
    def self.show(id)
      get("softcredit/#{id}")
    end

    ### Update soft credit
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits/put_softcredit__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("softcredit/#{id}", {}, body)
    end

    ### Delete soft credit
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Soft%20Credits/delete_softcredit__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("softcredit/#{id}")
    end
  end
end
