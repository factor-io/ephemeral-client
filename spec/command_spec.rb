# encoding: UTF-8

require 'spec_helper'
require 'ephemeral/command'
require 'securerandom'

describe 'Ephemeral::Command' do

  it 'can run' do
    command = Ephemeral::Command.new

    name = SecureRandom.hex(5)

    expect { 
      command.exec(name)
      }.to output("Hello: #{name}\n").to_stdout
  end
end