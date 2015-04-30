# encoding: UTF-8

require 'spec_helper'
require 'ephemeral/commands/build'
require 'commander'
require 'securerandom'

describe Ephemeral::Commands do
  describe Ephemeral::Commands::Build do
    it 'can run command' do
      args = ["https://github.com/skierkowski/hello-middleman"]
      options = Commander::Command::Options.new
      options.buildpack = 'ruby:2.1'
      options.framework = 'middleman'
      build_command = Ephemeral::Commands::Build.new
      expect{build_command.build(args,options)}.to output(/Starting build/).to_stdout
    end

    it 'fails without all params' do
      args = ["https://github.com/skierkowski/hello-middleman"]
      options = Commander::Command::Options.new
      options.buildpack = 'ruby:2.1'
      build_command = Ephemeral::Commands::Build.new
      expect{
        build_command.build(args,options)
      }.to output(/framework is required/).to_stderr.and raise_error(SystemExit)
    end
  end
end