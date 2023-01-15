# frozen_string_literal: true

require_relative "base"

module Bloomerang
  ### Bloomerang::Pledge
  ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges
  # Id                            integer($int64), The ID of the designation used in the API (not to be confused with DesignationNumber)
  # DesignationNumber             integer($int64), A user-friendly designation number used in the Bloomerang CRM UI (not to be confused with ID). In Bloomerang CRM Reporting, this is known as the Transaction Number.
  # TransactionId                 integer($int64), The ID of the transaction used in the API (not to be confused with transactionNumber)
  # Amount                        number($currency)
  # NonDeductibleAmount           number($currency)
  # Note                          string
  # AcknowledgementStatus         AcknowledgementStatus, string, Enum: [ Yes, No, DoNotAcknowledge ]
  # AcknowledgementInteractionIds array[integer], The IDs of interactions that acknowledge this designation
  # Fund                          PartialManagedValue (object)
  # QuickbooksAccount             PartialManagedValue (object)
  # Campaign                      PartialManagedValue (object)
  # Appeal                        PartialManagedValue (object)
  # Tribute                       PartialManagedValue (object)
  # TributeType                   TributeType, string, Enum: [ InHonorOf, InMemoryOf ]
  # SoftCreditIds                 array[integer], The IDs of the soft credits on this transaction
  # AttachmentIds                 array[integer], The IDs of the attachments on this transaction
  # CustomValues                  array[object], oneOf -> [OneValueAssignment (object), MultipleValueAssignments (object)]
  # QuickBooksOnlineStatus        string, If the QuickBooks Online integration is enabled, this is the QBO status of the designation
  # AuditTrail                    AuditTrail  (object)
  # Type                          PledgeType, string, Enum: [ Pledge ]
  # PledgePaymentIds              array[integer], The array of designation IDs of the payments on the pledge
  # PledgeInstallments            array[PledgeInstallment (object)]
  # PledgeBalance                 number($currency), The current outstanding balance on the pledge
  # LastPaymentStatus             LastPaymentStatus, string, Enum: [ AtRisk, Ended, Failed, NoPayment, Successful ]
  # PledgeStatus                  PledgeStatus, string, Enum: [ InGoodStanding, InArrears, Fulfilled, Overpaid, WrittenOff, PartiallyWrittenOff ]
  # PledgeWriteOffs               array[PledgeWreiteOff (object)]
  # PledgeAmountInArrears         number($currency), If the pledge is in arrears, this is the current amount by which the pledge is in arrears
  # PledgeNextInstallmentDate     string($date), iso8601 format, The next installment date for this pledge (if any)
  # PledgeFrequencyIsEditable     boolean, Determines whether the Pledge Frequency may be modified after the pledge has been created
  class Pledge < Base
    ### Fetch installments for a pledge
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges/get_pledge__id__installments
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # id              array[integer], separated by pipes: "1|2|3"
    def show_installments(id, params = {})
      get("pledge/#{id}/installments", params)
    end

    ### Generate pledge installments
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges/get_pledge_generateInstallments
    # Returns a list of pledge installments for a given set of criteria. Note that this will not persist to the database, but these can be used as the PledgeInstallments property when creating or modifying a Pledge.
    #
    # Params:
    # pledgeAmount          number, Total amount of the pledge
    # installmentAmount     number, Amount of each installment
    # firstInstallmentDate  string, iso8601 format
    # frequency             string, Available values : Weekly, EveryOtherWeekly, TwiceMonthly, Monthly, EveryOtherMonthly, Quarterly, Yearly, Custom
    # day1                  integer, Day1 & Day2 are only used with the TwiceMonthly frequency. If specified, day1 must be equal to the day value in firstInstallmentDate. If not specified, day1 will be set to the day value in firstInstallmentDate.
    # day2                  integer, Day1 & Day2 are only used with the TwiceMonthly frequency
    def generate_installments(params = {})
      get("pledge/generateInstallments", params)
    end

    ### Fetch successful payments for a pledge
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges/get_pledge__id__payments
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # id              array[integer], separated by pipes: "1|2|3"
    def show_payments(id, params = {})
      get("pledge/#{id}/payments", params)
    end

    ### Fetch failed payments for a pledge
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges/get_pledge__id__paymentFailures
    #
    # Params:
    # skip            integer, default: 0,  simple paging system
    # take            integer, default: 50, simple paging system
    # id              array[integer], separated by pipes: "1|2|3"
    def show_failed_payments(id, params = {})
      get("pledge/#{id}/paymentFailures", params)
    end

    ### Write off a pledge
    ## https://bloomerang.co/product/integrations-data-management/api/rest-api/#/Pledges/post_pledge__id__writeOff
    #
    # Params:
    # id  integer
    def write_off(id)
      post("pledge/#{id}/writeOff")
    end
  end
end
