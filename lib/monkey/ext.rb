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
          unless instance_methods.include? name.to_s or instance_methods.include? name.to_sym
            # Note: Ruby < 1.8.7 does not support { |*a, &b| } syntax.
            class_eval "def #{name}(*a, &b); Monkey::Backend.call(#{core_class.inspect}, #{name.to_s.inspect}, *a, &b); end"
          end
        end
      end

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