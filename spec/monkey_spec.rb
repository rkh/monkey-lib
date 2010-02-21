require __FILE__.sub(%r{monkey_spec\.rb$}, "spec_helper")

describe Monkey do
  describe :invisible do
    it "removes lines from a backtrace" do
      begin
        Monkey.invisible(__FILE__) { raise }
      rescue
        $!.backtrace.each do |line|
          line.should_not include(__FILE__)
        end
      end
    end
  end
end