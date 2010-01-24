require "monkey"

module Monkey
  module Autoloader
    def const_missing(const_name)
      const_name = const_name.to_s
      file = File.join(self.name.to_const_path, const_name.to_const_path)
      begin
        require file
        if const_defined? const_name
          const = const_get const_get
          const.extend Monkey::Autoloader
          const
        else
          warn "expected #{file} to define #{name}::#{const_name}"
          raise LoadError
        end
      rescue LoadError
        super
      end
    end
  end
end