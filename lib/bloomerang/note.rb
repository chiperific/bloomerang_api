# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Note
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes
  # Id                          integer($int64)
  # AttachmentIds               array[integer], The ID of the attachments on this interaction
  # AccountId                   integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # Date                        string($date), iso8601 format
  # Note                        string
  # CustomValues                array[object], oneOf -> [OneValueAssignment (object), MultipleValueAssignments (object)]
  # AuditTrail                  AuditTrail  (object)
  class Note < Base
    ### Fetch all notes
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes/get_notes
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # constituent     array[integer], separated by pipes: "1|2|3"
    # id              array[integer], separated by pipes: "1|2|3"
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def fetch(params = {})
      get("notes", params)
    end

    ### Create a note
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes/post_note
    #
    # Params:
    # body  JSON object, see API for fields
    def create(body)
      post("note", {}, body)
    end

    ### Fetch a note by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes/get_note__id_
    #
    # Params:
    # id  integer
    def get(id)
      get("note/#{id}")
    end

    ### Update a note
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes/put_note__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def update(id, body)
      put("note/#{id}", {}, body)
    end

    ### Delete a note by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Notes/delete_note__id_
    #
    # Params:
    # id  integer
    def delete(id)
      delete("note/#{id}")
    end
  end
end
