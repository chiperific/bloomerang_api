# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Task
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks
  # Id            integer($int64)
  # AccountId     integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # Status        TaskStatus, string, Enum: [ Active, Complete, Archived ]
  # CompletedDate string($date)
  # DueDate       string($date), iso8601 format
  # Subject       string
  # Note          string
  # Channel       Channel, string, Enum: [ Email, MassEmail, Phone, TextMessage, Mail, InPerson, SocialMedia, Website, Twitter, Other, EngagementSurveyEmail, EngagementSurvey ]
  # Purpose       Purpose, string, Enum: [ Acknowledgement, ImpactCultivation, Newsletter, Receipt, Solicitation, SpecialEvent, VolunteerActivity, PledgeReminder, Welcome, BenevonPointOfEntry, BenevonFollowUp, BenevonAskEvent, BenevonOneOnOneAsk, BenevonOngoingCultivation, Other ]
  # UserId        integer($int64), The ID of the user assigned to this task
  # InteractionId integer($int64), The ID of the interaction created by the completion of this task
  # AttachmentIds array[integer], The ID of the attachments on this interaction
  # AuditTrail    AuditTrail (object)
  class Task < Base
    ### Fetch all tasks
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/get_tasks
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # status          array[string], separated by pipes: "one|two|three", Available values : Active, Complete, Archived
    # minDueDate      string($date), Includes only tasks where the due date is on or after the parameter.
    # maxDueDate      string($date), Includes only tasks where the due date is on or before the parameter.
    # assignee        array[integer], separated by pipes: "1|2|3", Filters results based on the User ID the task is assigned to.
    # channel         array[string], separated by pipes: "one|two|three", Filters results based on the task's channel., Available values : Email, MassEmail, Phone, TextMessage, Mail, InPerson, SocialMedia, Website, Twitter, Other, EngagementSurveyEmail, EngagementSurvey
    # purpose         array[string], separated by pipes: "one|two|three", Filters results based on the task's purpose, Available values : Acknowledgement, ImpactCultivation, Newsletter, Receipt, Solicitation, SpecialEvent, VolunteerActivity, PledgeReminder, Welcome, BenevonPointOfEntry, BenevonFollowUp, BenevonAskEvent, BenevonOneOnOneAsk, BenevonOngoingCultivation, Other
    # constituent     array[integer], separated by pipes: "1|2|3"
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def self.fetch(params = {})
      get("tasks", params)
    end

    ### Create a task
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/post_task
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("task", {}, body)
    end

    ### Fetch a task by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/get_task__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("task/#{id}")
    end

    ### Update task
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/put_task__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("task/#{id}", {}, body)
    end

    ### Delete a task
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/delete_task__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("task/#{id}")
    end

    ### Complete a task
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Tasks/put_task__id__complete
    #
    # Params:
    # id                  integer
    # saveAsInteraction   boolean, True to create an interaction from the task; must be false if the task does not have a constituent
    # completedDate       string($date), default: Today, iso8601 format
    def self.complete(id, params = {})
      put("task/#{id}/complete", params)
    end
  end
end
