require __FILE__.sub(%r{monkey/.*$}, "spec_helper")

describe Monkey::Ext::Object do
  
  
  describe :instance_yield do

    before do
      @obj = Object.new
      @obj.stub! :foo
    end

    it "calls a block if block takes at least one argument" do
      foo = nil
      @obj.should_not_receive :foo
      @obj.send :instance_yield do |x|
        foo
      end
    end 

    it "passes object as first argument to blog" do
      @obj.send :instance_yield do |x|
        x.should == @obj
      end
    end

    it "passes the block to instance_eval if block doesn't take arguments" do
      @obj.should_receive :foo
      @obj.send :instance_yield do
        foo
      end
    end
    
  end
  
end