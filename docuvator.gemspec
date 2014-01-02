# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require 'docuvator/version'

Gem::Specification.new do |gem|
  gem.homepage      = 'https://github.com/kevinjalbert/docuvator'
  gem.authors       = ["Kevin Jalbert"]
  gem.email         = ["kevin.j.jalbert@gmail.com"]
  gem.name          = 'docuvator'
  gem.version       = Docuvator::VERSION
  gem.summary       = "Gem which extracts document statistics and information"
  gem.description   = "Gem which extracts document statistics and information"
  gem.require_paths = ["lib"]
  gem.files         = Dir['lib/**/*']
  gem.test_files    = Dir['spec/**/*_spec.rb']
  gem.required_ruby_version = '>= 1.9.3'
  gem.executables   = 'docuvator'
end
