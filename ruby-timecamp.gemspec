# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-timecamp/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-timecamp"
  spec.version       = Ruby::Timecamp::VERSION
  spec.authors       = ["Trevor Mast\n"]
  spec.email         = ["trevormast@gmail.com"]

  spec.summary       = %q{A simple wrapper for the Timecamp API}
  spec.homepage      = "https://github.com/trevormast/ruby-timecamp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rest-client", "~> 2.0.0"
  spec.add_development_dependency "activesupport", "~> 4.2.7.1"
  spec.add_development_dependency "vcr", "~> 3.0.3"
  spec.add_development_dependency "webmock", "~> 3.1.0"
end
