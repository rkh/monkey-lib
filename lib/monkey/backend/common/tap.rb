module Monkey
  module Backend
    module Common
      module Tap
        ::Kernel.send :include, self
        def tap
          yield self
          self
        end
      end
    end
  end
end