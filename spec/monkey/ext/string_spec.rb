require __FILE__.sub(%r{monkey/.*$}, "spec_helper")


describe Monkey::Ext::String do

  describe "like Pathname" do

    before do
      @strings = ["/usr/bin/ruby", ".", "..", ENV["HOME"]]
      @methods = Pathname.instance_methods(false).reject do |m|
        String.methods.include? m or m.to_s == "to_path"
      end
    end

    it "exposes cleanpath to String" do
      @strings.each do |s|
        s.cleanpath.should == Pathname(s).cleanpath.to_s
      end
    end

    it "exposes realpath to String" do
      @strings.each do |s|
        s.realpath.should == Pathname(s).realpath.to_s
      end
    end

    it "exposes mountpoint? to String" do
      @strings.each do |s|
        s.mountpoint?.should == Pathname(s).mountpoint?
      end
    end

    it "exposes root? to String" do
      @strings.each do |s|
        s.root?.should == Pathname(s).root?
      end
    end

    it "exposes absolute_path? to String" do
      @strings.each do |s|
        s.absolute_path?.should == Pathname(s).absolute?
      end
    end

    it "exposes file_relative? to String" do
      @strings.each do |s|
        s.file_relative?.should == Pathname(s).relative?
      end
    end

    it "exposes file_join to String" do
      @strings.each do |s|
        s.file_join("foo").should == Pathname(s).join("foo").to_s
      end
    end

    it "exposes atime to String" do
      @strings.each do |s|
        s.atime.should == Pathname(s).atime
      end
    end

    it "exposes ctime to String" do
      @strings.each do |s|
        s.ctime.should == Pathname(s).ctime
      end
    end

    it "exposes mtime to String" do
      @strings.each do |s|
        s.mtime.should == Pathname(s).mtime
      end
    end    

    it "exposes ftype to String" do
      @strings.each do |s|
        s.ftype.should == Pathname(s).ftype.to_s
      end
    end

    it "exposes basename to String" do
      @strings.each do |s|
        s.basename.should == Pathname(s).basename.to_s
      end
    end

    it "exposes dirname to String" do
      @strings.each do |s|
        s.dirname.should == Pathname(s).dirname.to_s
      end
    end

    it "exposes extname to String" do
      @strings.each do |s|
        s.extname.should == Pathname(s).extname.to_s
      end
    end

    it "exposes expand_path to String" do
      @strings.each do |s|
        s.expand_path.should == Pathname(s).expand_path.to_s
      end
    end

    it "exposes blockdev? to String" do
      @strings.each do |s|
        s.blockdev?.should == Pathname(s).blockdev?
      end
    end

    it "exposes chardev? to String" do
      @strings.each do |s|
        s.chardev?.should == Pathname(s).chardev?
      end
    end

    it "exposes file_executable? to String" do
      @strings.each do |s|
        s.file_executable?.should == Pathname(s).executable?
      end
    end

    it "exposes file_executable_real? to String" do
      @strings.each do |s|
        s.file_executable_real?.should == Pathname(s).executable_real?
      end
    end

    it "exposes atime to String" do
      @strings.each do |s|
        s.atime.should == Pathname(s).atime
      end
    end

    it "exposes ctime to String" do
      @strings.each do |s|
        s.ctime.should == Pathname(s).ctime
      end
    end

    it "exposes mtime to String" do
      @strings.each do |s|
        s.mtime.should == Pathname(s).mtime
      end
    end    

    it "exposes ftype to String" do
      @strings.each do |s|
        s.ftype.should == Pathname(s).ftype.to_s
      end
    end

    it "exposes basename to String" do
      @strings.each do |s|
        s.basename.should == Pathname(s).basename.to_s
      end
    end

    it "exposes dirname to String" do
      @strings.each do |s|
        s.dirname.should == Pathname(s).dirname.to_s
      end
    end

    it "exposes extname to String" do
      @strings.each do |s|
        s.extname.should == Pathname(s).extname.to_s
      end
    end

    it "exposes expand_path to String" do
      @strings.each do |s|
        s.expand_path.should == Pathname(s).expand_path.to_s
      end
    end

    it "exposes blockdev? to String" do
      @strings.each do |s|
        s.blockdev?.should == Pathname(s).blockdev?
      end
    end

    it "exposes chardev? to String" do
      @strings.each do |s|
        s.chardev?.should == Pathname(s).chardev?
      end
    end

    it "exposes file_executable? to String" do
      @strings.each do |s|
        s.file_executable?.should == Pathname(s).executable?
      end
    end

    it "exposes file_executable_real? to String" do
      @strings.each do |s|
        s.file_executable_real?.should == Pathname(s).executable_real?
      end
    end

    it "exposes directory? to String" do
      @strings.each do |s|
        s.directory?.should == Pathname(s).directory?
      end
    end

    it "exposes file? to String" do
      @strings.each do |s|
        s.file?.should == Pathname(s).file?
      end
    end

    it "exposes pipe? to String" do
      @strings.each do |s|
        s.pipe?.should == Pathname(s).pipe?
      end
    end

    it "exposes socket? to String" do
      @strings.each do |s|
        s.socket?.should == Pathname(s).socket?
      end
    end

    it "exposes file_owned? to String" do
      @strings.each do |s|
        s.file_owned?.should == Pathname(s).owned?
      end
    end

    it "exposes file_readable? to String" do
      @strings.each do |s|
        s.file_readable?.should == Pathname(s).readable?
      end
    end

    it "exposes file_readable_real? to String" do
      @strings.each do |s|
        s.file_readable_real?.should == Pathname(s).readable_real?
      end
    end

    it "exposes symlink? to String" do
      @strings.each do |s|
        s.symlink?.should == Pathname(s).symlink?
      end
    end

    it "exposes file_writable? to String" do
      @strings.each do |s|
        s.file_writable?.should == Pathname(s).writable?
      end
    end

    it "exposes file_writable_real? to String" do
      @strings.each do |s|
        s.file_writable_real?.should == Pathname(s).writable_real?
      end
    end

    it "exposes file_zero? to String" do
      @strings.each do |s|
        s.file_zero?.should == Pathname(s).zero?
      end
    end

    it "exposes file_exist? to String" do
      @strings.each do |s|
        s.file_exist?.should == Pathname(s).exist?
        s.file_exists?.should == Pathname(s).exist? 
      end
    end

    it "exposes file_grpowned? to String" do
      @strings.each do |s|
        s.file_grpowned?.should == Pathname(s).grpowned?
      end
    end

    it "exposes file_size? to String" do
      @strings.each do |s|
        s.file_size?.should == Pathname(s).size?
      end
    end

    it "exposes file_sticky? to String" do
      @strings.each do |s|
        s.file_sticky?.should == Pathname(s).sticky?
      end
    end

    it "exposes directory_children to String" do
      @strings.each do |s|
        s.directory_children.should == Pathname(s).children if s.directory?
      end
    end

  end

end