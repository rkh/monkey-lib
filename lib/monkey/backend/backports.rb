module Monkey
  module Backend
    module Backports
      def setup
        require "backports/1.8.7/kernel"
        require "backports/rails/array"
        require "backports/rails/string"
        require "monkey/backend/common/parent"
        require "monkey/backend/common/metaclass"
        ::String.class_eval do
          alias to_const_string camelcase
          alias to_const_path underscore
        end
      end
    end
  end
end
