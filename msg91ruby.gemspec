# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'msg91ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "msg91ruby"
  spec.version       = Msg91ruby::VERSION
  spec.authors       = ["rajesh"]
  spec.email         = ["rajeshnecg@gmail.com"]
  spec.summary       = %q{A Ruby gem to connect with Msg91 Api to send messages}
  spec.description   = %q{Connects to Msg91 api to send messages}
  spec.homepage      = "https://github.com/deeproot/msg91ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
