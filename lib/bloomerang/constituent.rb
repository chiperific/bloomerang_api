# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Constituent
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents
  # Id                            integer($int64), The ID of the constituent used in the API (not to be confused with AccountNumber)
  # AccountNumber                 integer($int64), A user-friendly account number used in the Bloomerang CRM UI (not to be confused with ID).
  # IsInHousehold                 boolean, Whether the Constituent is in a household
  # IsHeadOfHousehold             boolean, Whether the Constituent is in a household and is marked as the primary
  # IsFavorite                    boolean, True if this constituent is a favorite of the current user
  # FullCustomProfileImageId      integer($int64), The ID of the existing file attachment for the full version of the custom profile image.
  # FullCustomProfileImageUrl     string($url), The URL of the existing file attachment for the full version of the custom profile image.
  # CroppedCustomProfileImageId   integer($int64), The ID of the existing file attachment for the cropped version of the custom profile image.
  # CroppedCustomProfileImageUrl  string($url), The URL of the existing file attachment for the cropped version of the custom profile image.
  # Type                          ConstituentType: string, Enum: [ Individual, Organization ]
  # Status                        AccountStatus: string, Enum: [ Active, Inactive, Deceased ]
  # FirstName                     string
  # LastName                      string
  # MiddleName                    string
  # Prefix                        string, Must match a prefix in the Bloomerang CRM
  # Suffix                        string, Must match a suffix in the Bloomerang CRM
  # FullName                      string
  # InformalName                  string
  # FormalName                    string
  # EnvelopeName                  string
  # RecognitionName               string
  # JobTitle                      string
  # Employer                      string
  # Website                       string($uri)
  # FacebookId                    string
  # TwitterId                     string
  # LinkedInId                    string
  # Gender                        Gender: string, Enum: [ Male, Female, Other ]
  # Birthdate                     string($date)
  # ProfilePictureType            ProfilePictureType: string, Enum: [ None, Custom, Twitter ]
  # PrimaryEmail                  Email (object)
  # PrimaryPhone                  Phone (object)
  # HouseholdId                   integer($int64), The ID of the household this constituent is in (not to be confused with AccountNumber)
  # PreferredCommunicationChannel PreferredCommunicationChannel: string, Enum: [ Email, Phone, TextMessage, Mail ]
  # CommunicationRestrictions     array[string], Enum: [ DoNotCall, DoNotMail, DoNotSolicit ]
  # CommunicationRestrictionsUpdateReason string, The most-recent reason for updating this constituent's communication restrictions
  # EmailInterestType             EmailInterestType: string, Enum: [ All, Custom, OptedOut ]
  # CustomEmailInterests          array[integer($int64)], IDs for custom email interests if the email interest type is Custom
  # EmailInterestsUpdateReason    string, The most-recent reason for updating this constituent's email interests
  # PrimaryAddress                Address (object)
  # EngagementScore               EngagementScore: string, Enum: [ Low, MediumLow, Medium, MediumHigh, High ]
  # DonorSearchInfo               DonorSearchInfo (object)
  # AddressIds                    array[integer($int64)], The IDs of the addresses including the primary address ID
  # EmailIds                      array[integer($int64)], The IDs of the emails including the primary email ID
  # PhoneIds                      array[integer($int64)], The IDs of the phones including the primary phone ID
  # CustomValues                  array[Objects], Objects are either OneValueAssignment or MultipleValueAssignments
  # AuditTrail                    AuditTrail (Object)
  class Constituent < Base
    # for backwards compatability
    alias merge create

    ### Fetch all constituents
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituents
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # lastModified    string, date in iso8601 format, Filters to constituents last modified after the specified date
    # isFavorite      boolean, Filters constituents to only constituents the user has favorited.
    # type            string, Available values : Individual, Organization
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def all(params)
      get("constituents", params)
    end

    ### Show a constituent
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituent__id_
    #
    # Params:
    # id  integer
    def show(id)
      get("constituent/#{id}")
    end

    ### Show a constituent's relationships
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituent__id__relationships
    #
    # Params:
    # skip    integer, default: 0,  simple paging system
    # take    integer, default: 50, simple paging system
    # id      integer
    #
    # Returns: array of Relationships
    def show_relationships(id, params)
      get("constituent/#{id}/relationships", params)
    end

    ### Show a constituent's timeline
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituent__id__timeline
    # Retrieves TimelineEntrySummary for the Constituent or all members of a Household (if Household ID is passed in)
    #
    # Params:
    # skip    integer, default: 0,  simple paging system
    # take    integer, default: 50, simple paging system
    # id      integer
    #
    # Returns: paged list of TimelineEntrySummary models
    def show_timeline(id, params)
      get("constituent/#{id}/timeline", params)
    end

    ### Update a constituent's communication settings
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/put_constituent__id__updateCommunicationSettings
    #
    # Params:
    # id    integer
    # body  see API for fields
    def update_communication_settings(id, body)
      put("/constituent/#{id}/updateCommunicationSettings", {}, body)
    end

    ### Search for constituents and households
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/get_constituents_search
    #
    # Params:
    # skip    integer, default: 0,  simple paging system
    # take    integer, default: 50, simple paging system
    # search  string, searches on Full Name with
    def search(params)
      # TODO: BREAKING CHANGE: query changed to params
      get("constituents/search", params)
    end

    ### Create or update a constituent
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/post_constituent_merge
    #
    # Params:
    # body  see API for fields
    #
    # NOTE: acts like upsert:
    # "When merging, the database will look for a possible duplicate defined as a name
    # plus one piece of contact info (address, email, or phone).
    # If a duplicate is found, the data passed in will be merged into an existing constituent.
    # If no duplicate is found, a new constituent will be created."
    #
    # there is a create-only endpoint, but
    # given the risk of duplicate records, this should be the default method
    # for create-only over merge-or-create
    def create(body)
      # "When merging, the database will look for a possible duplicate defined as a
      # name plus one piece of contact info (address, email, or phone). If a duplicate
      # is found, the data passed in will be merged into an existing constituent.
      # If no duplicate is found, a new constituent will be created. Note that
      # this endpoint does not accept SecondaryAddresses, SecondaryEmails, or
      # SecondaryPhones and you will receive an exception if you pass those in.""
      post("constituent/merge", {}, body)
    end

    ### Create a constituent, including SecondaryEmail, SecondaryAddress and SecondaryPhone fields
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/post_constituent
    #
    # Params:
    # body  see API for fields
    #
    # NOTE: insert only, high risk of duplicates.
    # The only benefit of this method over #create is the ability to specify
    # secondary address, email and phone
    #
    # A more secure pattern would be to create the Constituent
    # then use the returned Constituent ID to check for Emails, Addresses and Phones,
    # and add records if necessary
    def create_with_secondary(body)
      post("constituent", {}, body)
    end

    ### Update a constituent
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/put_constituent__id_
    #
    # Params:
    # id    integer
    # body  see API for fields
    def update(id, body)
      put("constituent/#{id}", {}, body)
    end

    ### Search for duplicate constituents
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/post_constituent_duplicates
    #
    # Params:
    # body  see API for fields
    #
    # NOTE: There is a GET version as well,
    # but POST was chosen for future Model usage
    # e.g. body = Constituent.duplicate_check_attributes
    def find_duplicates(body)
      post("constituent/duplicates", {}, body)
    end

    ### Delete a constituent
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Constituents/delete_constituent__id_
    #
    # Params:
    # id  integer
    def delete(id)
      delete("constituent/#{id}")
    end
  end
end
