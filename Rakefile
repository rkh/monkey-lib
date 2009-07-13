require "spec/rake/spectask"
require "rake/clean"
require "rake/rdoctask"
require "rake/gempackagetask"
require "rubygems/specification"

MONKEY_VERSION = "0.1.4"

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

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{gem install pkg/monkey-lib-#{MONKEY_VERSION}.gem}
end
 
desc "create a gemspec file"
task :make_spec do
  File.open("monkey-lib.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end 
  
Rake::RDocTask.new("doc") do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.options += %w[--all --inline-source --line-numbers --main README.rdoc --quiet
    --tab-width 2 --title monkey-lib]
  rdoc.rdoc_files.add ['*.rdoc', 'lib/**/*.rb']
end

Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = Dir.glob 'spec/**/*_spec.rb'
end