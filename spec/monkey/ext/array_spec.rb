require __FILE__.sub(%r{monkey/.*$}, "spec_helper")

describe Monkey::Ext::Array do
  describe "backend expectations" do
    # expects :extract_options!
    it "imports extract_options! from backend" do
      [:foo, {:x => 10}].extract_options!.should == {:x => 10}
      [:foo].extract_options!.should == {}
      [{:x => 10}, :foo].extract_options!.should == {}
      ary1 = [:foo, {:x => 10}]
      ary1.extract_options!
      ary1.should == [:foo]
      ary2 = [{:x => 10}, :foo]
      ary2.extract_options!
      ary2.should == [{:x => 10}, :foo]
    end
  end
end