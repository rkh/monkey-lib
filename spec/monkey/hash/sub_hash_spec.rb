require __FILE__.sub("monkey/hash/sub_hash_spec.rb", "spec_helper")
require "monkey/hash/sub_hash"

describe Monkey::Hash::SubHash do
  
  it "returns a hash with only the key-value-pairs requested for sub_hash" do
    {:a => 10, :b => 20}.sub_hash(:a).should == {:a => 10}
    {:a => 10, :b => 20}.sub_hash(:a, :b).should == {:a => 10, :b => 20} 
  end
  
  it "should ignore keys passed to sub_hash, but not present" do
    {:a => 10, :b => 20}.sub_hash(:a, :c).should == {:a => 10}
  end
  
end