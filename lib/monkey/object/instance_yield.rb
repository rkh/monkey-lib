module Monkey
  module Object
    
    # Adds the private method instance_eval which is like instance_eval
    # and yield depending on whether a block takes an argument or not.
    #
    #   class Foo
    #
    #     def foo
    #       42
    #     end
    #
    #     def bar(&block)
    #       instance_yield block
    #     end
    #
    #   end
    #
    #   conf = Foo.new
    #   conf.bar { foo }
    #   conf.bar { |c| c.foo }
    module InstanceYield
      
      ::Object.send :include, self
      
      private
      
      # See InstanceYield description.
      def instance_yield(block = nil, &alternate_block)
        block ||= alternate_block
        raise LocalJumpError, "no block given (yield)" unless block
        block.arity > 0 ? yield(self) : instance_eval(&block)
      end
      
    end
  end
end