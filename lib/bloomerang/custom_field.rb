# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::CustomField
  # Id          integer($int64)
  # CategoryId  integer($int64)
  # Name        string
  # IsRequired  boolean
  # IsActive    boolean
  # DataType    CustomFieldDataType (object): string, Enum: [ Currency, Date, Decimal, Text, Year ]
  # PickType    CustomFieldPickType (object): string, Enum: [ Freeform, PickMultiple, PickOne ]
  # SortIndex   integer($int32)
  class CustomField
    ### Fetch CustomField Categories by type
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Custom%20Fields/get_customFieldCategories__type__
    #
    # Params:
    # type  string, Available values: Constituent, Transaction, Interaction, Note, Benevon
    def self.categories(type)
      get("/customFieldCategories/#{type}/")
    end

    ### Fetch CustomFields by type
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Custom%20Fields/get_customFields__type__
    #
    # Params:
    # type      string, Available values: Constituent, Transaction, Interaction, Note, Benevon
    # isActive  boolean, Default value: true
    def self.fields(type, params = {})
      get("/customFields/#{type}/", params)
    end

    ### Fetch CustomValues by type
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Custom%20Fields/get_customValues__type_
    #
    # Params:
    # type      string, Available values : Constituent, Transaction, Interaction, Note, Benevon
    # isActive  boolean, Default value: true
    def self.values(type, params = {})
      get("/customValues/#{type}/", params)
    end

    ### Fetch CustomValues by type for the given field
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Custom%20Fields/get_customValues__type___fieldId_
    #
    # Params:
    # type      string, Available values : Constituent, Transaction, Interaction, Note, Benevon
    # fieldId   integer
    # isActive  boolean, Default value: true
    def self.values_by_field(type, field_id, params = {})
      get("/customValues/#{type}/#{field_id}", params)
    end
  end
end
