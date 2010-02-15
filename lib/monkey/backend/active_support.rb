Monkey::Backend.new :ActiveSupport, :active_support do
  def self.setup
    load_lib :version
    expects_module "::ActiveSupport::CoreExtensions::String::Inflections" if ::ActiveSupport::VERSION::MAJOR < 3
    load_libs "core_ext/object" => [:metaclass, :misc], :core_ext => %w[array/extract_options string/inflections module/introspection]
    if ::ActiveSupport::VERSION::MAJOR < 3
      ::Array.send :include, ::ActiveSupport::CoreExtensions::Array::ExtractOptions
      ::Module.send :include, ::ActiveSupport::CoreExtensions::Module
    end
    ::String.class_eval do
      alias to_const_string camelcase
      alias to_const_path underscore
    end
  end
end