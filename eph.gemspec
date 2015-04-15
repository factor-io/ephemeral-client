# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ephemeral/version'

Gem::Specification.new do |s|
  s.name          = 'eph'
  s.version       = Ephemeral::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Maciej Skierkowski']
  s.email         = ['maciej@factor.io']
  s.homepage      = 'https://factor.io'
  s.summary       = 'CLI for Ephemeral.io'
  s.description   = 'Manage the Ephemeral.io service'
  s.files         = Dir.glob('lib/**/*.rb')
  s.license       = "MIT"

  s.test_files    = Dir.glob("./{test,spec,features}/*.rb")
  s.executables   = ['eph']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'thor', '~> 0.19', '>= 0.19.1'
  
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
  s.add_development_dependency 'rake', '~> 10.4' ,'>= 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
end
