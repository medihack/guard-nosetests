# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/nosetests/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-nosetests"
  gem.version       = Guard::NosetestsVersion::VERSION
  gem.authors       = ["Kai Schlamp"]
  gem.email         = ["schlamp@gmx.de"]
  gem.description   = %q{Automatically run your Python nose tests}
  gem.summary       = %q{Guard gem for Python nose tests}
  gem.homepage      = "https://github.com/medihack/guard-nosetests"

  gem.add_dependency 'guard', '>= 1.1'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
