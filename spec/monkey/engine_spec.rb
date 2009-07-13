require __FILE__.sub("monkey/engine_spec.rb", "spec_helper")
require "monkey/engine"

describe Monkey::Engine do
  
  it "defines RUBY_VERSION" do
    defined?(RUBY_VERSION).should == "constant"
  end
  
  it "defines RUBY_ENGINE_VERSION" do
    defined?(RUBY_ENGINE_VERSION).should == "constant"
  end
  
  it "defines RUBY_DESCRIPTION" do
    defined?(RUBY_DESCRIPTION).should == "constant"
  end
  
end