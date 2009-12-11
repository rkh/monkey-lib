module Monkey
  module Ext
    module Module
      
      # Defined by backend.
      expects :parent
      
      def nested_method_missing(mod, meth, *args, &block)
        # Triggers method_missing chain inside mod.
        raise Monkey::Watcher::NestedMethodMissingNotHandled
      end
      
      def class_added(klass)
      end
      
      def module_added(mod)
        return if self == parent
        class_added mod if mod.is_a? Class
        parent.module_added mod
      end
      
    end
  end
end