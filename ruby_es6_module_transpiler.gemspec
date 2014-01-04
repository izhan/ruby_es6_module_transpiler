# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_es6_module_transpiler/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_es6_module_transpiler"
  spec.version       = RubyEs6ModuleTranspiler::VERSION
  spec.authors       = ["Irvin Zhan"]
  spec.description   = %q{Ruby ES6 Module Transpiler is a bridge to the JS ES6 Module Transpiler}
  spec.summary       = %q{Preparing your JS for the next generation ES6.  Uses Square's ES6 Module Transpiler (https://github.com/square/es6-module-transpiler)}
  spec.homepage      = "https://github.com/izhan/ruby_es6_module_transpiler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'execjs'
  
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
