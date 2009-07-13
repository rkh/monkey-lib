require "spec/rake/spectask"
require "rake/clean"
require "rake/rdoctask" 
  
Rake::RDocTask.new("doc") do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.options += %w[--all --inline-source --line-numbers --main README.rdoc --quiet
    --tab-width 2 --title Async::HTTP]
  rdoc.rdoc_files.add ['*.rdoc', 'lib/**/*.rb']
end

Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = Dir.glob 'spec/**/*_spec.rb'
end