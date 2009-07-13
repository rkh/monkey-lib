require "pathname"
require "extlib/pathname"

module Monkey
  module String
    
    # Adds Pathname behaviour to String.
    module LikePathname
      
      ::String.send :include, self
      
      Pathname.instance_methods(false).each do |m|
        # Syntax error in Ruby < 1.9:
        #   define_method(m) { |*a, &b| ... }
        next if "".respond_to? m or m.to_s == "to_path"
        class_eval <<-EOS
          def #{m}(*a, &b)
            result = Pathname(self).#{m}(*a, &b)
            return result unless result.is_a? Pathname
            result.to_s
          end
        EOS
      end
      
      #def method_missing(meth, *args, &block)
      #  pathname = Pathname self
      #  return super unless pathname.respond_to? meth
      #  result = pathname.send(meth, *args, &block)
      #  return result.to_s if result.is_a? Pathname
      #  result
      #end
      
    end
        
  end
end