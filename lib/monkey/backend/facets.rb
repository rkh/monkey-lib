module Monkey
  module Backend
    module Facets
      def setup
        # Actually, facets has Kernel#tap, but it behaves different if the block takes no argument.
        require "monkey/backend/common/tap"
        require "monkey/backend/common/extract_options"
        require "monkey/backend/common/parent"
        require "core/facets/kernel/meta_class"
        require "core/facets/kernel/constant"
        ::String.class_eval do
          def constantize
            constant modulize
          end
          alias to_const_string camelcase
          alias to_const_path snakecase
          alias underscore snakecase
        end
      end
    end
  end
end