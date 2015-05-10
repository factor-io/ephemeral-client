# encoding: UTF-8

require 'spec_helper'
require 'ephemeral/client'

describe 'Ephemeral::Client' do
  
  describe 'build' do
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
      expect(response).to have_key('id')
    end
  end

  describe 'getLogs' do
    it 'returns array from id' do
      test_client = Ephemeral::Client.new
      response = test_client.build("ruby:2.1", "https://github.com/skierkowski/hello-middleman", "middleman")
      logs = test_client.getLogs(response['id'])
      expect(logs).to be_an_instance_of(Array)
    end
  end
end