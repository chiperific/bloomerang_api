# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Interaction
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions
  # Id                          integer($int64)
  # Date                        string($date), iso8601 format
  # Note                        string
  # Channel                     Channel object, string, Enum: [ Email, MassEmail, Phone, TextMessage, Mail, InPerson, SocialMedia, Website, Twitter, Other, EngagementSurveyEmail, EngagementSurvey ]
  # Purpose                     Purpose, string, Enum: [ Acknowledgement, ImpactCultivation, Newsletter, Receipt, Solicitation, SpecialEvent, VolunteerActivity, PledgeReminder, Welcome, BenevonPointOfEntry, BenevonFollowUp, BenevonAskEvent, BenevonOneOnOneAsk, BenevonOngoingCultivation, Other ]
  # Subject                     string
  # IsInbound                   boolean
  # AccountId                   integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # TweetId                     string, If the Channel is Twitter, this contains the ID of the tweet that can be used to display the tweet by substituting into https://twitter.com/anyUser/status/{TweetId}
  # IsBcc                       boolean, Whether or not this interaction was created by an email that was sent to Bloomerang via BCC
  # EmailAddress                string($email), If the interaction is an email interaction, this is the email address of the constituent that received the email. Only populated when IsBcc is true.
  # AttachmentIds               array[integer], The ID of the attachments on this interaction
  # LetterAttachmentIds         array[integer], The ID of generated letter attachments on this interaction.
  # SurveyLapsedResponses       array[string], The list of reasons the donor lapsed, if this interaction represents a lapsed donor survey response
  # IsEngagementSurveyResponse  boolean, Whether this interaction represents a donor survey response
  # SurveyEmailInteractionId    integer($int64), The interaction ID of the survey email that was sent to the donor. Only populated when IsEngagementSurveyResponse is true
  # IsEngagementSurveyEmail     boolean, Whether this interaction represents a survey email that was sent to the donor
  # SurveyResponseInteractionId integer($int64), The interaction ID of the survey response. Only populated when IsEngagementSurveyEmail is true.
  # CustomValues                array[object], oneOf -> [OneValueAssignment (object), MultipleValueAssignments (object)]
  # AuditTrail                  AuditTrail  (object)
  class Interaction < Base
    ### Fetch all interactions
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions/get_interactions
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # channel         array[string], Available values : Email, MassEmail, Phone, TextMessage, Mail, InPerson, SocialMedia, Website, Twitter, Other, EngagementSurveyEmail, EngagementSurvey
    # purpose         array[string], Available values : Acknowledgement, ImpactCultivation, Newsletter, Receipt, Solicitation, SpecialEvent, VolunteerActivity, PledgeReminder, Welcome, BenevonPointOfEntry, BenevonFollowUp, BenevonAskEvent, BenevonOneOnOneAsk, BenevonOngoingCultivation, Other
    # constituent     array[integer], separated by pipes: "1|2|3"
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def fetch(params = {})
      get("interactions", params)
    end

    ### Create an interaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions/post_interaction
    #
    # Params:
    # body  JSON object, see API for fields
    def create(body)
      post("interaction", {}, body)
    end

    ### Fetch interaction by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions/get_interaction__id_
    #
    # Params:
    # id  integer
    def get(id)
      get("interaction/#{id}")
    end

    ### Update interaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions/put_interaction__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def update(id, body)
      put("interaction/#{id}", {}, body)
    end

    ### Delete interaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Interactions/delete_interaction__id_
    #
    # Params:
    # id  integer
    def delete(id)
      delete("interaction/#{id}")
    end
  end
end
