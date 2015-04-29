# encoding: UTF-8

require 'spec_helper'
require 'ephemeral/client'

describe 'Ephemeral::Client' do
  
  it 'expects 3 arguments' do
    test_client = Ephemeral::Client.new
    expect{
      test_client.build
    }.to raise_error ArgumentError
  end

  it 'returns a hash' do
    test_client = Ephemeral::Client.new
    response = test_client.build("ruby:2.1", "https://github.com/skierkowski/hello-middleman", "middleman")
    expect(response).to be_an_instance_of Hash
  end

  it 'returns a hash which contains an id' do
    test_client = Ephemeral::Client.new
    response = test_client.build("ruby:2.1", "https://github.com/skierkowski/hello-middleman", "middleman")
    expect(response['id'].nil?).to equal false
  end
end