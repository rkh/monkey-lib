require __FILE__.sub("monkey/object/backports_spec.rb", "spec_helper")
require "monkey/object/backports"

describe Monkey::Object::Backports do
  
  it "returns returns the reciever of #tap" do
    obj = Object.new
    obj.tap {}.should == obj
    "example".tap {}.should == "example"
  end
  
  it "passes the reciever of #tap to the given block" do
    "foo".tap { |s| s.replace "bar" }.should == "bar"
  end
  
  it "returns eigenclass for #metaclass" do
    obj = Object.new
    eigenclass = class << obj
      self
    end
    obj.metaclass.should == eigenclass
  end
  
end