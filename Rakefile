require "spec/rake/spectask"
require "rake/clean"

task :default => :spec

backends = Dir.glob('lib/monkey/backend/*.rb').map { |f| File.basename f, ".rb" }
modes = [:autodetect, :explicit]

CLEAN.include "**/*.rbc"
CLOBBER.include "monkey-lib*.gem"

def spec_task(name, backend = nil, mode = nil)
  Spec::Rake::SpecTask.new name do |t|
    t.spec_opts = %w[-c --format progress --loadby mtime --reverse]
    t.ruby_cmd = "BACKEND=#{backend.to_s.inspect} BACKEND_SETUP=#{mode.to_s.inspect} #{RUBY}"
    t.pattern = 'spec/monkey/**/*_spec.rb'
  end
end

task :environment do
  $LOAD_PATH.unshift "lib"
  require "monkey"
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
  task :expectations => :environment do
    Monkey::Ext.expectations.each do |core_class, methods|
      print "#{core_class}:".ljust(10)
      puts methods.map { |n| "##{n}" }.join(", ")
    end
  end

  desc "checks whether specs for expectations are present"
  task :spec_check =>:environment do
    Monkey::Ext.expectations.each do |core_class, methods|
      path = "spec/monkey/ext/#{core_class.name.to_const_path}_spec.rb"
      list = path.file_exists? ? %x[spec -d -fs #{path} -e "Monkey::Ext::#{core_class.name} backend expectations"] : ""
      methods.each { |m| puts "missing specs for #{core_class.name}##{m}" unless list =~ /- imports #{m} from backend/ }
    end
  end

end

############
# aliases

namespace(:b) do
  task :e => "backend:expectations"
  task :l => "backend:list"
  task :s => "backend:spec_check"
end

namespace(:s) do
  task :as => "spec:active_support:explicit"
  task :bp => "spec:backports:explicit"
  task :ex => "spec:extlib:explicit"
  task :fc => "spec:facets:explicit"
end
