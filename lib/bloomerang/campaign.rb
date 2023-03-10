# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ## Bloomerang::Campaign
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns
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
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns/get_campaigns
    #
    ## Params:
    # skip      integer, default: 0,  simple paging system
    # take      integer, default: 50, simple paging system
    # id        array[integer], separated by pipes: "one|two|three"
    # IsActive  boolean
    # search    string, returns matches on any part of name
    # hasGoal   boolean, have either non-zero-dollar or zero-dollar goals
    def self.fetch(params = {})
      get("campaigns", params)
    end

    ### Show single campaign
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns/get_campaign__id_
    #
    # Params:
    # id integer
    def self.show(id)
      get("campaign/#{id}")
    end

    ### Update single campaign
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns/put_campaign__id_
    #
    ## Params:
    # id   integer
    # body JSON object, see API for fields
    def self.update(id, body)
      put("campaign/#{id}", {}, body)
    end

    ### Create single campaign
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns/post_campaign
    #
    ## Params:
    # body JSON object, see API for fields
    def self.create(body)
      post("campaign", {}, body)
    end

    ### Refresh summaries
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Campaigns/get_campaigns_refreshsummaries
    # Refreshes campaign goals
    # Returns: JSON: The list of campaigns that are active and have a non-zero goal.
    #
    ## Params: none
    def self.refresh_summaries
      get("campaigns/refreshsummaries")
    end
  end
end
