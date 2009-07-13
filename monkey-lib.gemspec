Gem::Specification.new do |s|
  s.name             = "monkey-lib"
  s.version          = "0.1.2"
  s.authors          = ["Konstantin Haase"]
  s.description      = "collection of sane ruby extensions"
  s.email            = "konstantin.mailinglists@googlemail.com"
  s.extra_rdoc_files = Dir["README.rdoc", "LICENSE", "lib/**/*.rb"]
  s.files            = Dir["LICENSE", "Rakefile", "README.rdoc", "lib/**/*.rb", "spec/**/*.rb"]
  s.has_rdoc         = true
  s.homepage         = "http://github.com/rkh/monkey-lib"
  s.require_paths    = ["lib"]
  s.summary          = s.description
  s.add_dependency "extlib"
end