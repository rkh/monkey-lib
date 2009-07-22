# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{monkey-lib}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Konstantin Haase"]
  s.date = %q{2009-07-13}
  s.description = %q{collection of sane ruby extensions}
  s.email = %q{konstantin.mailinglists@googlemail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "lib/monkey/engine.rb", "lib/monkey/hash/sub_hash.rb", "lib/monkey/hash.rb", "lib/monkey/object/backports.rb", "lib/monkey/object.rb", "lib/monkey/string/like_pathname.rb", "lib/monkey/string.rb", "lib/monkey-lib.rb", "lib/monkey.rb"]
  s.files = ["LICENSE", "Rakefile", "README.rdoc", "lib/monkey/engine.rb", "lib/monkey/hash/sub_hash.rb", "lib/monkey/hash.rb", "lib/monkey/object/backports.rb", "lib/monkey/object.rb", "lib/monkey/string/like_pathname.rb", "lib/monkey/string.rb", "lib/monkey-lib.rb", "lib/monkey.rb", "spec/monkey/engine_spec.rb", "spec/monkey/hash/sub_hash_spec.rb", "spec/monkey/object/backports_spec.rb", "spec/monkey/string/like_pathname_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/rkh/monkey-lib}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
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
