module Monkey
  module Ext
    module Object
      
      # Defined by backend.
      expects :metaclass, :tap
      
      # Behaves like instance_eval or yield depending on whether a block takes an argument or not.
      #
      #   class Foo
      #     define_method(:foo) { 42 }
      #   end
      #
      #   Foo.new.instance_yield { foo }        # => 42
      #   Foo.new.instance_yield { |c| c.foo }  # => 42
      #
      # Also, you can pass a proc directly:
      #
      #   block = proc { }
      #   instance_yield(block)
      def instance_yield(block = nil, &alternate_block)
        raise ArgumentError, "too many blocks given" if block && alternate_block
        block ||= alternate_block
        raise LocalJumpError, "no block given (yield)" unless block
        block.arity > 0 ? yield(self) : instance_eval(&block)
      end
      
      def metaclass_eval(&block)
        metaclass.class_eval(&block)
      end
      
      def define_singleton_method(name, &block)
        metaclass_eval { define_method(name, &block) }
      end
      
    end
  end
end