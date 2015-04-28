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

  it 'returns an id' do
    test_client = Ephemeral::Client.new
    response = test_client.build("test", "test", "test")
    expect(response).to have_type String
  end
end