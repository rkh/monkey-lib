require "set"

module Monkey
  module Backend

    autoload :ActiveSupport,   "monkey/backend/active_support"
    autoload :BackendDsl,      "monkey/backend/backend_dsl"
    autoload :Backports,       "monkey/backend/backports"
    autoload :Extlib,          "monkey/backend/extlib"

    def self.register(definition, expected_name, backend_name = nil)
      klass = definition.core_klass
      add_hook klass, expected_name
      add_hook klass, backend_name if backend_name
      backend_name ||= expected_name
    end

    def preferred_backend
      available_backends.detect { |b| eval "defined? ::#{b}" }
    end

    def available_backends
      @available_backends ||= Set[:ActiveSupport, :Extlib, :Backports]
    end

    def backend
      @backend || preferred_backend || available_backends.first
    end

    private

    def self.add_hook(klass, name)
      mod = module_for klass
      mod.class_eval "def #{name}(*a, &b); Monkey::Backend.call(#{klass.name}, #{name}, *a, &b); end"
    end

    def self.module_for(klass, &block)
      mod = eval "module Monkey::Ext; module #{klass.name}; self; end; end"
      klass.send :include, mod
      mod.class_eval(&block) if block
      mod
    end

  end
end