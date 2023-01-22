# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Household
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households
  # FullName                string
  # SortName                string
  # InformalName            string
  # FormalName              string
  # EnvelopeName            string
  # RecognitionName         string
  # Id                      integer($int64), The ID of the household used in the API (not to be confused with AccountNumber)
  # AccountNumber           integer($int64), A user-friendly account number used in the Bloomerang CRM UI (not to be confused with ID).
  # Type                    HouseholdType, string, Enum: [ Household ]
  # Status                  AccountStatus, string, Enum: [ Active, Inactive, Deceased ]
  # HeadId                  integer($int64), The ID of the head of household used in the API (not to be confused with AccountNumber)
  # MemberIds [...]         array[integer], The IDs of the members of the household used in the API, including the head of household's ID (not to be confused with AccountNumber)
  # CommunicationRestrictions CommunicationRestriction, string, Enum: [ DoNotCall, DoNotMail, DoNotSolicit ]
  # AuditTrail                AuditTrail object
  # IsFavorite                boolean, True if this constituent is a favorite of the current user
  # EngagementScore           EngagementScore, string, Enum: [ Low, MediumLow, Medium, MediumHigh, High ]
  class Household < Base
    ### Fetch all households
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/get_households
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # lastModified    string, date in iso8601 format, Filters to constituents last modified after the specified date
    # id              array[integer], separated by pipes: "1|2|3"
    def self.fetch(params = {})
      get("households", params)
    end

    ### Fetch a household by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/get_household__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("household/#{id}")
    end

    ### Search for constituents and households
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituents_search
    #
    # Params:
    # skip    integer, default: 0,  simple paging system
    # take    integer, default: 50, simple paging system
    # search  string, searches on household name and constituent full name, matches any part of string
    def self.search(params = {})
      # TODO: BREAKING CHANGE: query changed to params
      Constituent.search(params)
    end

    ### Create a household
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/post_household
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("household", {}, body)
    end

    ### Update a household
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/put_household__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("household/#{id}", {}, body)
    end

    ### Delete a household
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/delete_household__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("household/#{id}")
    end

    ### Update household communication settings
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Households/put_household__id__updateCommunicationSettings
    #
    # Params:
    # id    integer
    # body JSON object, see API for fields
    def self.update_communication_settings(id, body)
      put("household/#{id}/updateCommunicationSettings", {}, body)
    end
  end
end
