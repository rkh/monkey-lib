Monkey::Backend.new :ActiveSupport, :active_support do
  def self.setup
    expects_module "::ActiveSupport::CoreExtensions::String::Inflections"
    load_libs "core_ext/object" => [:metaclass, :misc], :core_ext => %w[array/extract_options string/inflections module/introspection]
    Array.send :include, ActiveSupport::CoreExtensions::Array::ExtractOptions
    Module.send :include, ActiveSupport::CoreExtensions::Module
    ::String.class_eval do
      alias to_const_string camelcase
      alias to_const_path underscore
    end
  end     
end