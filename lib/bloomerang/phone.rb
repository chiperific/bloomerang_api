# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Phone
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones
  # Id        integer($int64)
  # AccountId integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # Type      PhoneType, string, Enum: [ Home, Work, Mobile, Fax ]
  # Extension string
  # Number    string($phone), The phone number including formatting but not the extension
  # IsPrimary boolean
  class Phone < Base
    ### Fetch all phones
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones/get_phones
    #
    # Params:
    # skip          integer, default: 0,  simple paging system
    # take          integer, default: 50, simple paging system
    # constituent   array[integer], separated by pipes: "1|2|3"
    # id            array[integer], separated by pipes: "1|2|3"
    def self.fetch(params = {})
      get("phones", params)
    end

    ### Create phone
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones/post_phone
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("phone", {}, body)
    end

    ### Fetch phone by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones/get_phone__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("phone/#{id}")
    end

    ### Update phone
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones/put_phone__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("phone/#{id}", {}, body)
    end

    ### Delete phone
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Phones/delete_phone__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("phone/#{id}")
    end
  end
end
