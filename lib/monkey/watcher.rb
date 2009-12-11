module Monkey
  # NOTE: Not thread-safe!
  module Watcher

    IDENTIFIER = "@__module_detected__"

    class NestedMethodMissingNotHandled < ScriptError
    end

    module ObjectWatcher
      ::Object.extend self

      def inherited(klass)
        Monkey::Watcher.module_defined(klass)
        super
      end

    end

    module MethodWatcher
      ::Module.send :include, self

      def method_added(name)
        Monkey::Watcher.method_defined(self, name)
        super
      end

      def method_missing(name, *args, &block)
        if Monkey::Watcher.detected? self
          begin
            Monkey::Watcher.module_method_missing(self, *args, &block)
          rescue Monkey::Watcher::NestedMethodMissingNotHandled
            super
          end
        else
          Monkey::Watcher.module_defined self
          if Monkey::Watcher.detected? self
            __send__(name, *args, &block)
          else
            super
          end
        end
      end

    end

    module ModuleWatcher
      ::Module.extend self

      def new(*what, &ever)
        super.tap { |k| Monkey::Watcher.module_defined(klass) }
      end

    end

    module NamelessModuleWatcher

      def __watcher_initialize__
        @__original_methods__ = {}
        if respond_to? :set_name_if_necessary 
          __watcher_wrap_method__ "set_name_if_necessary"
        else
          methods.each do |name|
            name = name.to_s
            next if name =~ /^__/
            __watcher_wrap_method__ name
          end
        end
        define_singleton_method("method_addded") do |name|
          __watcher_wrap_method__ name unless Monkey::Watcher.detected? self
          super
        end
      end

      def __watcher_wrap_method__(name)
        @__original_methods__[name] = method(name)
        eval "def self.#{name}(*a, &b); __watcher_wrap_call__(#{name.inspect}, *a, &b); end"
      end

      def __watcher_wrap_call__(meth, *args, &block)
        Monkey::Watcher.module_defined(klass)
        @__original_methods__[meth].call(*args, &block).tap do
          next if name.blank?
          Monkey::Watcher.module_defined(klass)
          methods_names = @__original_methods__.keys
          methods_names.each { |m| define_singleton_method(m, &@__original_methods__.delete(m)) }
          undef __watcher_initialize__
          undef __watcher_wrap_method__
          undef __watcher_wrap_call__
        end
      end

      def self.extended(klass)
        klass.__watcher_initialize__
        super
      end

    end

    def self.module_defined(klass)
      return if detected? klass
      return nameless_module_defined(klass) unless klass.name
      klass.instance_variable_set IDENTIFIER, true
      klass.parent.module_added(klass)
      klass.constants.each do |name|
        mod = klass.const_get name
        module_defined mod if mod.is_a? Module
      end
    end

    def self.nameless_module_defined(klass)
      return if hooked? klass
      klass.instance_variable_set IDENTIFIER, false
      klass.extend NamelessModuleWatcher
    end

    def self.method_defined(klass, name)
      module_defined(klass)
    end

    def self.hooked?(klass)
      klass.instance_variable_defined? IDENTIFIER
    end

    def self.detected?(klass)
      !!klass.instance_variable_get IDENTIFIER
    end

    def self.setup
      begin
        ObjectSpace.each_object(Module) { |klass| module_defined(klass) }
      rescue Exception
        # Thus we meet at last, JRuby!
        module_defined Object
      end
    end

  end
end