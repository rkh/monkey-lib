module Monkey
  module Hash
    
    # Adds sub hash ablilty (like Hash#[], but returning a hash rather than an array).
    module SubHash
      
      ::Hash.send :include, self

      # Example:
      #   {:a => 42, :b => 23, :c => 1337}.sub_hash :a, :b, :d
      #   # => {:a => 42, :b => 23} 
      def sub_hash(*keys)
        keys.inject({}) do |hash, key|
          hash.merge! key => self[key] if include? key
          hash
        end
      end
      
      alias subhash sub_hash
      
    end
  end
end