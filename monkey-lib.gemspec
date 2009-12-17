# -*- encoding: utf-8 -*-
SPEC = Gem::Specification.new do |s|
  s.name             = "monkey-lib"
  s.version          = "0.3.0"
  s.authors          = ["Konstantin Haase"]
  s.description      = "Making ruby extension frameworks pluggable."
  s.email            = "konstantin.mailinglists@googlemail.com"
  s.extra_rdoc_files = Dir["*.rdoc", "LICENSE", "lib/**/*.rb"]
  s.files            = Dir["LICENSE", "Rakefile", "README.rdoc", "lib/**/*.rb", "spec/**/*.rb"]
  s.has_rdoc         = true
  s.homepage         = "http://github.com/rkh/monkey-lib"
  s.require_paths    = ["lib"]
  s.summary          = s.description
end