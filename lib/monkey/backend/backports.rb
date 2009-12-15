Monkey::Backend.new :Backports do
  def self.setup
    load_libs "tools", "1.8.7/kernel", :rails => [:array, :string]
    missing :parent, :metaclass
    ::String.class_eval do
      alias camelcase camelize
      alias to_const_string camelize
      alias to_const_path underscore
    end
  end
end
