Monkey::Backend.new :Facets do
  def self.setup
    load_libs :kernel => [:meta_class, :constant], :string => [:camelcase, :snakecase]
    # Actually, facets has Kernel#tap, but it behaves different if the block takes no argument.
    missing :tap, :extract_options, :parent
    ::String.class_eval do
      def constantize
        constant modulize
      end
      alias to_const_string camelcase
      alias to_const_path snakecase
      alias underscore snakecase
    end
  end
end