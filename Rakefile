require "spec/rake/spectask"
require "rake/clean"

task :default => :spec

backends = Dir.glob('lib/monkey/backend/*.rb').map { |f| File.basename f, ".rb" }
modes = [:autodetect, :explicit]

CLEAN   << "*.rbc"
CLOBBER << "monkey-lib*.gem"

def load_monkey
  $LOAD_PATH.unshift "lib"
  require "monkey"
end

def spec_task(name, backend = nil, mode = nil)
  Spec::Rake::SpecTask.new name do |t|
    t.spec_opts = %w[-c --format progress --loadby mtime --reverse]
    t.ruby_cmd = "BACKEND=#{backend.to_s.inspect} BACKEND_SETUP=#{mode.to_s.inspect} #{RUBY}"
    t.pattern = 'spec/monkey/**/*_spec.rb'
  end
end

desc "run all specs"
task :spec => "spec:all"
namespace :spec do
  desc "runs specs without explicitly setting a backend"
  spec_task :autodetect
  backends.each do |backend|
    task :all => backend
    desc "runs specs with backend #{backend}"
    task backend => "#{backend}:all"
    namespace backend do
      modes.each do |mode|
        task :all => mode
        desc "runs specs with backend #{backend} (#{mode} mode)"
        spec_task mode, backend, mode
      end
    end
  end
end

namespace :backend do
  desc "lists all available backends"
  task(:list) { puts backends }
  desc "lists expectations a backend has to meet"
  task :expectations do
    load_monkey
    Monkey::Ext.expectations.each do |core_class, methods|
      print "#{core_class}:".ljust(10)
      puts methods.map { |n| "##{n}" }.join(", ")
    end
  end
end

=begin
MONKEY_VERSION = "0.2.2"
spec = Gem::Specification.new do |s|
  s.name             = "monkey-lib"
  s.version          = MONKEY_VERSION
  s.authors          = ["Konstantin Haase"]
  s.description      = "collection of sane ruby extensions"
  s.email            = "konstantin.mailinglists@googlemail.com"
  s.extra_rdoc_files = Dir["*.rdoc", "LICENSE", "lib/**/*.rb"]
  s.files            = Dir["LICENSE", "Rakefile", "README.rdoc", "lib/**/*.rb", "spec/**/*.rb"]
  s.has_rdoc         = true
  s.homepage         = "http://github.com/rkh/monkey-lib"
  s.require_paths    = ["lib"]
  s.summary          = s.description
  s.add_dependency "extlib"
end
=end