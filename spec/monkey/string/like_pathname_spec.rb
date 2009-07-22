require __FILE__.sub("monkey/string/like_pathname_spec.rb", "spec_helper")
require "monkey/string/like_pathname"

describe Monkey::String::LikePathname do
  
  before do
    @strings = ["/usr/bin/ruby", ".", "..", ENV["HOME"]]
    @methods = Pathname.instance_methods(false).reject do |m|
      String.methods.include? m or m.to_s == "to_path"
    end
  end
  
  it "exposes sub_ext to String if in ruby 1.9" do
    @strings.each do |s|
      s.sub_ext(".png").should == Pathname(s).sub_ext(".png").to_s
    end if RUBY_VERSION >= "1.9"
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

  it "exposes parent to String" do
    @strings.each do |s|
      s.parent.should == Pathname(s).parent.to_s
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

  it "exposes absolute? to String" do
    @strings.each do |s|
      s.absolute?.should == Pathname(s).absolute?
    end
  end

  it "exposes relative? to String" do
    @strings.each do |s|
      s.relative?.should == Pathname(s).relative?
    end
  end

  it "exposes each_filename to String if in ruby 1.9" do
    @strings.each do |s|
      s.each_filename.to_a.should == Pathname(s).each_filename.to_a
    end if RUBY_VERSION >= "1.9"
  end

  it "exposes join to String" do
    @strings.each do |s|
      s.join.should == Pathname(s).join.to_s
    end
  end

  it "exposes children to String" do
    @strings.each do |s|
      s.children.should == Pathname(s).children if s.directory?
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

  it "exposes executable? to String" do
    @strings.each do |s|
      s.executable?.should == Pathname(s).executable?
    end
  end

  it "exposes executable_real? to String" do
    @strings.each do |s|
      s.executable_real?.should == Pathname(s).executable_real?
    end
  end

  it "exposes exist? to String" do
    @strings.each do |s|
      s.exist?.should == Pathname(s).exist?
      s.exists?.should == Pathname(s).exist? 
    end
  end

  it "exposes grpowned? to String" do
    @strings.each do |s|
      s.grpowned?.should == Pathname(s).grpowned?
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

  it "exposes owned? to String" do
    @strings.each do |s|
      s.owned?.should == Pathname(s).owned?
    end
  end

  it "exposes readable? to String" do
    @strings.each do |s|
      s.readable?.should == Pathname(s).readable?
    end
  end

  it "exposes world_readable? to String  in ruby 1.9" do
    @strings.each do |s|
      s.world_readable?.should == Pathname(s).world_readable?
    end if RUBY_VERSION >= "1.9"
  end

  it "exposes readable_real? to String" do
    @strings.each do |s|
      s.readable_real?.should == Pathname(s).readable_real?
    end
  end

  it "exposes setuid? to String" do
    @strings.each do |s|
      s.setuid?.should == Pathname(s).setuid?
    end
  end

  it "exposes setgid? to String" do
    @strings.each do |s|
      s.setgid?.should == Pathname(s).setgid?
    end
  end

  it "exposes size? to String" do
    @strings.each do |s|
      s.size?.should == Pathname(s).size?
    end
  end

  it "exposes sticky? to String" do
    @strings.each do |s|
      s.sticky?.should == Pathname(s).sticky?
    end
  end

  it "exposes symlink? to String" do
    @strings.each do |s|
      s.symlink?.should == Pathname(s).symlink?
    end
  end

  it "exposes writable? to String" do
    @strings.each do |s|
      s.writable?.should == Pathname(s).writable?
    end
  end

  it "exposes world_writable? to String in ruby 1.9" do
    @strings.each do |s|
      s.world_writable?.should == Pathname(s).world_writable?
    end if RUBY_VERSION >= "1.9"
  end

  it "exposes writable_real? to String" do
    @strings.each do |s|
      s.writable_real?.should == Pathname(s).writable_real?
    end
  end

  it "exposes zero? to String" do
    @strings.each do |s|
      s.zero?.should == Pathname(s).zero?
    end
  end

  it "exposes entries to String in ruby 1.9" do
    @strings.each do |s|
      s.entries.should == Pathname(s).entries if s.directory?
    end if RUBY_VERSION >= "1.9"
  end
    
end