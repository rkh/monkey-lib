module Monkey
  module Ext

    module ExtDSL

      def core_class(klass = nil)
        if klass
          @core_class = klass
          klass.send :include, self
        end
        return @core_class
      end

      def expects(*list)
        list.each do |name|
          Monkey::Ext.expectations[core_class] << name
          # Note: Ruby < 1.8.7 does not support { |*a, &b| } syntax.
          class_eval(<<-EOS, __FILE__, __LINE__ + 1)
            def #{name}(*a, &b)
              #{self.name}.send :remove_method, __method__
              Monkey::Backend.setup
              __send__(__method__, *a, &b)
            end
          EOS
        end
      end

    end
    
    def self.expectations
      @expectations ||= Hash.new { |h,k| h[k] = [] }
    end

    Dir[File.dirname(__FILE__) + "/ext/*.rb"].sort.each do |path|
      filename   = File.basename(path, '.rb')
      class_name = filename.capitalize
      extension  = class_eval "module #{class_name}; self; end"
      extension.extend ExtDSL
      extension.core_class Object.const_get(class_name)
      require "monkey/ext/#{filename}"
    end

  end
end