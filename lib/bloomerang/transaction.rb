module Bloomerang
  class Transaction < Base
    def all
      get("transactions")
    end

    def get_designations
      get("transactions/designations")
    end

    def create(body)
      post("transaction", {}, body)
    end
  end
end
