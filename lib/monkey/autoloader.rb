require "monkey"

module Monkey
  module Autoloader
    def const_missing(const_name)
      const_name = const_name.to_s
      file = File.join(self.name.to_const_path, const_name.to_const_path)
      begin
        require file
        if const_defined? const_name
          const = const_get const_name
          const.extend Monkey::Autoloader
          constants.each { |c| c.extend Monkey::Autoloader if c.is_a? Module and not c.is_a? Monkey::Autoloader }
          const
        else
          warn "expected #{file} to define #{name}::#{const_name}"
          raise LoadError
        end
      rescue LoadError
        begin
          return parent.const_get(const_name) if parent != self
        rescue NameError
        end
        super
      end
    end
  end
end