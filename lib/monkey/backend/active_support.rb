module Monkey
  module Backend
    module ActiveSupport
      def self.setup
        require "active_support/core_ext/array/extract_options"
        require "active_support/core_ext/object/metaclass"
        require "active_support/core_ext/object/misc"
        require "active_support/core_ext/string/inflection"
        require "active_support/core_ext/module/introspection"
        ::String.class_eval do
          alias to_const_string camelcase
          alias to_const_path underscore
        end
      end     
    end
  end
end