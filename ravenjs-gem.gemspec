$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ravenjs-gem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ravenjs-gem"
  s.version     = RavenjsGem::VERSION
  s.authors     = ["Christian Vuerings", "Scot Hacker", "Yu-Hung Lin"]
  s.email       = ["vueringschristian@gmail.com", "yuhung@yuhunglin.com"]
  s.homepage    = "http://github.com/ets-berkeley-edu/ravenjs-gem"
  s.summary     = "Raven.js - JavaScript client for Sentry"
  s.description = "Include Raven.js in your Rails projects"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.add_dependency "railties", [">= 3.1"]

  s.add_development_dependency "bundler", [">= 1.2.2"]
end
