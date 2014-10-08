# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/icode/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-icode"
  spec.version       = Omniauth::Icode::VERSION
  spec.authors       = ["Sam McTaggart"]
  spec.email         = ["sam.mctaggart@launchacademy.com"]
  spec.summary       = %q{Omniauth strategy for iCode}
  spec.description   = %q{the best description in the world}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
