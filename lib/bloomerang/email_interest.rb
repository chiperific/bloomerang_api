# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang:EmailInterest
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Interests
  # Id                    integer($int64)
  # IsSurveyEmailInterest boolean, Is this an email interest for Bloomerang donor surveys?
  # SortIndex             integer($int32)
  # Name                  string
  # IsDefault             boolean
  # IsActive              boolean
  class EmailInterest < Base
    ### Fetch all email interests
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Interests/get_emailInterests
    #
    # Params:
    # skip      integer, default: 0,  simple paging system
    # take      integer, default: 50, simple paging system
    # id        array[integer], separated by pipes: "1|2|3"
    # isActive  boolean
    def self.fetch(params = {})
      get("emailInterests", params)
    end

    ### Fetch an email interest by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Email%20Interests/get_emailInterest__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("emailInterest/#{id}")
    end
  end
end
