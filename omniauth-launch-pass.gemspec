# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/launch_pass/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-launch-pass"
  spec.version       = Omniauth::LaunchPass::VERSION
  spec.authors       = ["Sam McTaggart", "Dan Pickett"]
  spec.email         = [
    "sam.mctaggart@launchacademy.com",
    "dan.pickett@launchacademy.com"
  ]

  spec.summary       = %q{Omniauth strategy for Launch Pass}
  spec.description   = %q{Launch Academy's single sign on client}
  spec.homepage      = "https://launchacademy.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "vcr"
end
