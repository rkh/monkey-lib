module Monkey
  module Object
    
    # Backports from newer / alternate ruby implementations.
    module Backports
      
      ::Object.send :include, self

      # From Ruby >= 1.8.7
      def tap
        yield self
        self
      end
      
      # From Rubinius
      def metaclass
        class << self
          self
        end
      end
      
    end
  end
end