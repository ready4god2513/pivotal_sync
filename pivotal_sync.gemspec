# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pivotal_sync/version'

Gem::Specification.new do |spec|
  spec.name          = "pivotal_sync"
  spec.version       = PivotalSync::VERSION
  spec.authors       = ["Brandon Hansen"]
  spec.email         = ["brandonh@ibethel.org"]
  spec.description   = %q{Read from the Pivotal Tracker v4 api.  Next version will include pushing.}
  spec.summary       = %q{Read from the Pivotal Tracker v4 api}
  spec.homepage      = "https://github.com/ready4god2513/pivotal_sync"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "happymapper"
end
