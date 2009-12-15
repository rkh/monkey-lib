Monkey::Backend.new :Extlib do
  def self.setup
    load_libs :object, :string, :inflection
    missing :parent, :extract_options, :tap
    ::Object.class_eval { alias metaclass meta_class }
    ::String.class_eval do
      alias camelcase to_const_string
      alias underscore to_const_path
      def constantize
        Extlib::Inflection.constantize(self)
      end
    end
  end
end
