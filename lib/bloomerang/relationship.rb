# frozen_string_literal: true

module Bloomerang
  ### Bloomerang::Relationship
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationships
  # Id                    integer($int64)
  # AccountId1*           integer($int64)
  # AccountId2*           integer($int64)
  # Note                  string
  # RelationshipRoleId1*  id from RelationshipRole (object)
  # RelationshipRoleId2*  id from RelationshipRole (object)
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationship%20Roles
  # Id        integer($int64)
  # SortIndex integer($int32)
  # Name      string
  # IsDefault boolean, Is this the default?
  # IsActive  boolean, Is this active?
  class Relationship < Base
    #### Relationships:
    ### Create a relationship between two non-household constituents
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationships/post_relationship
    #
    # Params:
    # body  JSON object, see API for fields
    def self.create(body)
      post("relationship", {}, body)
    end

    ### Fetch a relationship by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationships/get_relationship__id_
    #
    # Params:
    # id  integer
    def self.show(id)
      get("relationship/#{id}")
    end

    ### Update a relationship
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationships/put_relationship__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def self.update(id, body)
      put("relationship/#{id}", {}, body)
    end

    ### Delete a relationship
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationships/delete_relationship__id_
    #
    # Params:
    # id  integer
    def self.delete(id)
      delete("relationship/#{id}")
    end

    #### ROLES:
    ### Fetch all roles
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationship%20Roles/get_relationshiproles
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # id              array[integer], separated by pipes: "1|2|3"
    # name            array[string], Filters to relationship roles with the names in the list (pipe-separated)
    # isActive        boolean, Filters to either active or inactive relationship roles
    def self.fetch_roles(params = {})
      get("relationshiproles", params)
    end

    ### Fetch role by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Relationship%20Roles/get_relationshiprole__id_
    #
    # Params:
    # id  integer
    def self.get_role(role_id)
      get("relationshiprole/#{role_id}")
    end
  end
end
