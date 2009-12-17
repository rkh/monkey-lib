require __FILE__.sub(%r{monkey/.*$}, "spec_helper")

describe Monkey::Ext::Module do
  describe "backend expectations" do
    # expects :parent
    it "imports parent from backend" do
      Monkey::Ext::Module.parent.should == Monkey::Ext
      Monkey::Ext.parent.should == Monkey
      Monkey.parent.should == Object
      Object.parent.should == Object
      Foo = Monkey::Ext::Module
      Foo.parent.should == Monkey::Ext
    end
  end
end