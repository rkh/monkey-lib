module Monkey
  module Ext
    module Array
      # Defined by backend.
      expects :extract_options!

      def select!(&block)
        return :to_enum if block.nil? and respond_to? :to_enum
        replace select(&block)
      end

    end
  end
end