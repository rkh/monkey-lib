module Monkey
  module Backend
    module Extlib
      def setup
        require "extlib/object"
        require "extlib/string"
        require "extlib/constantize"
        require "monkey/backend/common/parent"
        require "monkey/backend/common/extract_options"
        require "monkey/backend/common/tap"
        ::Object.class_eval { alias metaclass meta_class }
        ::String.class_eval do
          alias camelcase to_const_string
          alias underscore to_const_path
          def constantize
            Extlib::Inflection.constantize(self)
          end
        end
      end
    end
  end
end
