Gem::Specification.new do |s|
  s.name             = "monkey-lib"
  s.version          = "0.1.0"
  s.authors          = ["Konstantin Haase"]
  s.description      = "collection of sane ruby extensions"
  s.email            = "konstantin.mailinglists@googlemail.com"
  s.extra_rdoc_files = Dir["README.rdoc", "LICENSE", "**/*.rb"]
  s.files            = Dir["LICENSE", "Rakefile", "README.rdoc", "**/*.rb"]
  s.has_rdoc         = true
  s.homepage         = "http://github.com/rkh/monkey-lib"
  s.require_paths    = ["lib"]
  s.summary          = s.description
  s.add_dependency "extlib"
end