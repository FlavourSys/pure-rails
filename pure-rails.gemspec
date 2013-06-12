$:.push File.expand_path("../lib", __FILE__)

require "pure/version"

Gem::Specification.new do |s|
  s.name        = "pure-rails"
  s.version     = Pure::Rails::VERSION
  s.authors     = ['FlavourSys GmbH & Co. KG']
  s.email       = ['technology@flavoursys.com']
  s.homepage    = 'https://github.com/flavoursys/pure-rails'
  s.summary     = %q{Pure CSS for Rails}
  s.description = %{A gem which injects the Yahoo Pure CSS framework into your RoR application}
  s.license     = 'MIT'

  s.files = Dir["{lib,vendor}/**/*"] + ['MIT-LICENSE', 'Rakefile', 'README.md']

  s.require_paths = ['lib']

  s.add_development_dependency 'httparty'
end
