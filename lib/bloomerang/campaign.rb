# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ## Bloomerang::Campaign
  # Id        integer($int64)
  # Raised    number($currency)
  # The total amount raised for this campaign

  # StartDate string($date) iso8601 format
  # EndDate   string($date) iso8601 format
  # Goal      number($currency)
  # Name      string
  # SortIndex integer($int32)
  # IsActive  boolean
  class Campaign < Base
    ### Fetch all campaigns
    #
    ## Params:
    # skip      integer, default: 0,  simple paging system
    # take      integer, default: 50, simple paging system
    # id        array[integer], separated by pipes: "one|two|three"
    # IsActive  boolean
    # search    string, returns matches on any part of name
    # hasGoal   boolean, have either non-zero-dollar or zero-dollar goals
    def all(params)
      get("campaigns", params)
    end

    ### Show single campaign
    #
    # Params:
    # id integer
    def show(id)
      get("campaign/#{id}")
    end

    ### Update single campaign
    #
    ## Params:
    # id   integer
    # body JSON object, see https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns
    def update(id, body)
      put("campaign/#{id}", body)
    end

    ### Create single campaign
    #
    ## Params:
    # body JSON object, see https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns
    def create(body)
      post("campaign", body)
    end

    ### Refresh summaries
    # Refreshes campaign goals
    # Returns: JSON: The list of campaigns that are active and have a non-zero goal.
    #
    ## Params: none
    def refresh_summaries
      get("campaigns/refreshsummaries")
    end
  end
end
