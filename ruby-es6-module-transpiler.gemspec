Gem::Specification.new do |s|
  s.name        = 'ruby-es6-module-transpiler'
  s.version     = '0.0.2'
  s.date        = '2014-01-03'
  s.summary     = "Ruby ES6 Module Transpiler is a bridge to the JS ES6 Module Transpiler"
  s.description = "Preparing your JS for the next generation ES6.  Uses Square's ES6 Module Transpiler (https://github.com/square/es6-module-transpiler)"
  s.authors     = ["Irvin Zhan"]
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.homepage    = "https://github.com/izhan/ruby-es6-module-transpiler"
  s.license       = 'MIT'

  s.add_dependency 'execjs'
end