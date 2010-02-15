require __FILE__.sub(%r{monkey/.*$}, "spec_helper")

describe Monkey::Ext::Module do
  describe "backend expectations" do
    # expects :parent
    it "imports parent from backend" do
      Monkey::Ext::Module.parent.should == Monkey::Ext
      Monkey::Ext.parent.should == Monkey
      Monkey.parent.should == Object
      Object.parent.should == Object
      Object.send :remove_const, :ExtFoo if Object.const_defined? :ExtFoo
      ExtFoo = Monkey::Ext::Module
      ExtFoo.parent.should == Monkey::Ext
    end
  end
end