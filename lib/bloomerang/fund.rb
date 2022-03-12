module Bloomerang
  class Fund < Base
    def all
      get("funds")
    end
  end
end
