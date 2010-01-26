module Monkey
  module Ext

    module ExtDSL

      def core_class(klass = nil)
        if klass
          @core_class = klass
          klass.send :include, self
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

      def expects(*list)
        list.each do |name|
          Monkey::Ext.expectations[core_class] << name.to_s
        end
      end

    end

    def self.expectations
      @expectations ||= Hash.new { |h,k| h[k] = [] }
    end

    Dir[File.dirname(__FILE__) + "/ext/*.rb"].sort.each do |path|
      filename   = File.basename(path, '.rb')
      class_name = filename.capitalize
      extension  = eval "module ::Monkey::Ext::#{class_name}; self; end" # <- for MacRuby!?
      extension.extend ExtDSL
      extension.core_class Object.const_get(class_name)
      require "monkey/ext/#{filename}"
    end

  end
end