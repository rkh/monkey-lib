Monkey::Backend.new :ActiveSupport, :active_support do
  def setup
    load_lib :version
    expects_module "::ActiveSupport::CoreExtensions::String::Inflections" if version < "3"
    load_libs "core_ext/object" => [:metaclass, :misc], :core_ext => %w[array/extract_options string/inflections module/introspection]
    if version < "3"
      ::Array.send :include, ::ActiveSupport::CoreExtensions::Array::ExtractOptions
      ::Module.send :include, ::ActiveSupport::CoreExtensions::Module
    end
    ::String.class_eval do
      alias to_const_string camelcase
      alias to_const_path underscore
    end
    ::Object.class_eval do
      alias singleton_class metaclass unless respond_to? :singleton_class
    end
  end

  def version(default = "0")
    load_lib :version
    @version ||= ActiveSupport::VERSION::STRING or super
  rescue NameError
    super
  end
end