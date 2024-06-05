$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "attach_it/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "attach_it"
  s.version     = AttachIt::VERSION
  s.authors     = ["Tommaso Patrizi"]
  s.email       = ["tommasop@thinkingco.de"]
  s.homepage    = "https://github.com/tommasop/attach_it"
  s.summary     = "AttachIt is a simple engine for adding multiple files to any Rails model."
  s.description = "AttachIt is a simple engine for adding multiple files to any Rails model."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2", "< 6.0"
  s.add_runtime_dependency "dragonfly"
  s.add_runtime_dependency 'bootstrap-sass'
  s.add_runtime_dependency 'sass-rails'

  s.add_development_dependency "sqlite3"
end
