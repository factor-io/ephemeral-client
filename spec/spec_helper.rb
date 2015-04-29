# encoding: UTF-8

require 'codeclimate-test-reporter'
# require 'webmock/rspec'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "http://ephemeral.io/build").
      with(:body => "{\"image\":\"test\",\"repo\":\"test\",\"command\":\"test\"}",
          :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'47', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "testid", :headers => {})
  end
end
  