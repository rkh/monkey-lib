# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{monkey-lib}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Konstantin Haase"]
  s.date = %q{2009-12-11}
  s.description = %q{collection of sane ruby extensions}
  s.email = %q{konstantin.mailinglists@googlemail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "lib/monkey/autoloader.rb", "lib/monkey/backend/active_support.rb", "lib/monkey/backend/backports.rb", "lib/monkey/backend/common/extract_options.rb", "lib/monkey/backend/common/metaclass.rb", "lib/monkey/backend/common/parent.rb", "lib/monkey/backend/common/tap.rb", "lib/monkey/backend/extlib.rb", "lib/monkey/backend/facets.rb", "lib/monkey/backend.rb", "lib/monkey/engine.rb", "lib/monkey/ext/array.rb", "lib/monkey/ext/module.rb", "lib/monkey/ext/object.rb", "lib/monkey/ext/string.rb", "lib/monkey/ext.rb", "lib/monkey/string/like_pathname.rb", "lib/monkey/watcher.rb", "lib/monkey-lib.rb", "lib/monkey.rb"]
  s.files = ["LICENSE", "Rakefile", "README.rdoc", "lib/monkey/autoloader.rb", "lib/monkey/backend/active_support.rb", "lib/monkey/backend/backports.rb", "lib/monkey/backend/common/extract_options.rb", "lib/monkey/backend/common/metaclass.rb", "lib/monkey/backend/common/parent.rb", "lib/monkey/backend/common/tap.rb", "lib/monkey/backend/extlib.rb", "lib/monkey/backend/facets.rb", "lib/monkey/backend.rb", "lib/monkey/engine.rb", "lib/monkey/ext/array.rb", "lib/monkey/ext/module.rb", "lib/monkey/ext/object.rb", "lib/monkey/ext/string.rb", "lib/monkey/ext.rb", "lib/monkey/string/like_pathname.rb", "lib/monkey/watcher.rb", "lib/monkey-lib.rb", "lib/monkey.rb", "spec/monkey/engine_spec.rb", "spec/monkey/hash/sub_hash_spec.rb", "spec/monkey/object/backports_spec.rb", "spec/monkey/object/instance_yield_spec.rb", "spec/monkey/string/like_pathname_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/rkh/monkey-lib}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{collection of sane ruby extensions}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<extlib>, [">= 0"])
    else
      s.add_dependency(%q<extlib>, [">= 0"])
    end
  else
    s.add_dependency(%q<extlib>, [">= 0"])
  end
end
