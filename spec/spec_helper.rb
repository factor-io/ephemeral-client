# encoding: UTF-8

require 'codeclimate-test-reporter'
require 'webmock/rspec'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

WebMock.disable_net_connect!(allow_localhost: true)
