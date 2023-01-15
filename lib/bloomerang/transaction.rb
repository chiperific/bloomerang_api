# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Transaction
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions
  # Id                        integer($int64), The ID of the transaction used in the API (not to be confused with TransactionNumber)
  # TransactionNumber         integer($int64), A user-friendly transaction number used in the Bloomerang CRM UI (not to be confused with ID). In Bloomerang CRM Reporting, this is known as the Payment Number.
  # NonDeductibleAmount       number($currency)
  # AccountId                 integer($int64), The ID of the constituent used in the API (not to be confused with accountNumber)
  # Date                      string($date)
  # Amount                    number($currency)
  # Method                    PaymentMethodType, string, Enum: [ None, Cash, Check, CreditCard, Eft, InKind ]
  # CheckNumber               string
  # CheckDate                 string($date)
  # CreditCardType            CreditCardType, string, Enum: [ Visa, MasterCard, Discover, AmericanExpress, DinersClub, JCB ]
  # CreditCardLastFourDigits  string
  # CreditCardExpMonth        number
  # CreditCardExpYear         number
  # EftAccountType            EftAccountType, string, Enum: [ Checking, Savings ]
  # EftLastFourDigits         string
  # EftRoutingNumber          string
  # InKindDescription         string
  # InKindType                InKindType, string Enum: [ Goods, Services ]
  # InKindMarketValue         number($currency)
  # IntegrationUrl            string, The deep URL when a transaction is created by qgiv
  # Designations              array[one of multiple potential objects] see API for options
  # AttachmentIds             array[integer], The ID of the attachments on this interaction
  # IsRefunded                string, Enum: [ Yes, No ]
  # RefundIds                 array[integer], The IDs of the refunds on this transaction. Currently, there will be zero or one refunds. This is an array to allow partial and multiple refunds in the future if needed.
  # AuditTrail                AuditTrail  (object)
  class Transaction < Base
    # for backwards compatability
    alias get_designations all_designations

    ### Fetch all transactions
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/get_transactions
    #
    # Params:
    # skip                integer, default: 0,  simple paging system
    # take                integer, default: 50, simple paging system
    # transactionNumber   array[integer], Filters results based on the transaction's transactionNumber (called Payment Number in Bloomerang CRM Reporting).
    # accountID           array[integer], separated by pipes: "1|2|3"
    # id                  array[integer], separated by pipes: "1|2|3"
    # type                array[string], separated by pipes: "one|two|three", Available values : Donation, Pledge, PledgePayment, RecurringDonation, RecurringDonationPayment
    # minAmount           number, Filters results based on the transaction's amount (inclusive).
    # maxAmount           number, Filters results based on the transaction's amount (inclusive).
    # orderBy         string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection  string, Available values : Asc, Desc
    def all(params = {})
      get("transactions", params)
    end

    ### Create a transaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/post_transaction
    #
    # Params:
    # body  JSON object, see API for fiends
    def create(body)
      post("transaction", {}, body)
    end

    ### Fetch a transaction by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/get_transaction__id_
    #
    # Params:
    # id  integer
    def show(id)
      get("transaction/#{id}")
    end

    ### Update transaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/put_transaction__id_
    #
    # Params:
    # id    integer
    # body  JSON object, see API for fields
    def update(id, body)
      put("transaction/#{id}", {}, body)
    end

    ### Delete transaction
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/delete_transaction__id_
    #
    # Params:
    # id  integer
    def delete(id)
      delete("transaction/#{id}")
    end

    ### Fetch all designations
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/get_transactions_designations
    #
    # Params:
    # skip                integer, default: 0,  simple paging system
    # take                integer, default: 50, simple paging system
    # designationNumbers  array[integer], separated by pipes: "1|2|3", Filters results based on the designation's designationNumber.
    # transactionIds      array[integer], separated by pipes: "1|2|3", Filters results based on the transaction ID for the designation.
    # id                  array[integer], separated by pipes: "1|2|3"
    # orderBy             string, Available values : Id (default), CreatedDate, LastModifiedDate
    # orderDirection      string, Available values : Asc, Desc
    def all_designations(params = {})
      get("transactions/designations", params)
    end

    ### Fetch a designation by ID
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Transactions/get_transactions_designation__id_
    #
    # Params:
    # id  integer
    def show_designation(id)
      get("transactions/designation/#{id}")
    end
  end
end
