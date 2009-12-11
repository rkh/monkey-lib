module Monkey
  module Backend
    module Common
      module Metaclass
        ::Object.send :include, self
        def metaclass
          class << self
            self
          end
        end
      end
    end
  end
end