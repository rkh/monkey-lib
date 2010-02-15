require "pathname"

module Monkey
  module Ext

    module ExtDSL

      def core_class(klass = nil)
        if klass
          @core_class = klass
          klass.send :include, self
          klass.extend self::ClassMethods if defined? self::ClassMethods
          @core_class.class_eval <<-EOS
            def method_missing(meth, *args, &blk)
              return super if Monkey::Backend.setup?
              Monkey::Backend.setup
              __send__(meth, *args, &blk)
            end
          EOS
        end
        return @core_class
      end
      
      def rename_core_method(old_name, new_name)
        new_name = new_name % old_name if new_name.is_a? String
        core_class.class_eval do
          alias_method new_name, old_name
          undef_method old_name
        end
      end
      
      def wrap_core_methods(list = {})
        list.each do |old_name, new_name|
          rename_core_method old_name, new_name
          define_method(old_name) { |*args| send(new_name, old_name, *args) }
        end
      end
      
      def feature(name, mode = :instance, &block)
        case mode
        when :instance then block.call
        when :class then class_methods(&block)
        when :shared
          feature(name, :instance, &block)
          feature(name, :class, &block)
        else raise ArgumentError, "unkown mode #{mode.inspect}"
        end
      end
      
      def class_methods(&block)
        raise NotImplementedError
      end

      def expects(*list)
        list.each do |name|
          Monkey::Ext.expectations[core_class] << name.to_s
        end
      end

    end

    def self.expectations
      @expectations ||= Hash.new { |h,k| h[k] = [] }
    end

    Dir[::File.dirname(__FILE__) + "/ext/*.rb"].sort.each do |path|
      filename   = ::File.basename(path, '.rb')
      class_name = filename.capitalize
      extension  = eval "module ::Monkey::Ext::#{class_name}; self; end" # <- for MacRuby!?
      extension.extend ExtDSL
      extension.core_class Object.const_get(class_name)
      require "monkey/ext/#{filename}"
    end

  end
end