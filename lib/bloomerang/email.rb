# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Email
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses
  # Id        integer($int64)
  # AccountId integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # Type      EmailType string, Enum: [ Home, Work ]
  # Value     string($email), The email address
  # IsPrimary boolean
  # IsBad     boolean
  class Email < Base
    ### Fetch all emails
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses/get_emails
    #
    # Params:
    # skip          integer, default: 0,  simple paging system
    # take          integer, default: 50, simple paging system
    # constituent   array[integer], separated by pipes: "1|2|3"
    # id            array[integer], separated by pipes: "1|2|3"
    def all(params = {})
      get("emails", params)
    end

    ### Fetch email by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses/get_email__id_
    #
    # Params:
    # id  integer
    def show(id)
      get("email/#{id}")
    end

    ### Create email
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses/post_email
    #
    # Params:
    # body  JSON object, see API for fields
    def create(body)
      post("email", {}, body)
    end

    ### Update email
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses/put_email__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def update(id, body)
      put("email/#{id}", {}, body)
    end

    ### Delete email
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Addresses/delete_email__id_
    #
    # Params:
    # id  integer
    def delete(id)
      delete("email/#{id}")
    end
  end
end
